import 'dart:typed_data';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:asn1lib/asn1lib.dart';

class RSAKeyParser {
  /// Parses the PEM string and returns either an RSAPublicKey or RSAPrivateKey.
  dynamic parse(String pem) {
    final derBytes = _hexToBytes(pem);

    final asn1Parser = ASN1Parser(derBytes);
    final topLevel = asn1Parser.nextObject();

    if (topLevel is! ASN1Sequence) {
      throw FormatException('Top-level ASN.1 object is not a sequence.');
    }
    final topLevelSeq = topLevel;

    if (topLevelSeq.elements.length == 2 &&
        topLevelSeq.elements[1] is ASN1BitString) {
      final publicKeyBitString = topLevelSeq.elements[1] as ASN1BitString;

      final pubKeyBytes = _stripBitStringPadding(publicKeyBitString);

      final pkParser = ASN1Parser(pubKeyBytes);
      final pkTop = pkParser.nextObject();
      if (pkTop is! ASN1Sequence) {
        throw FormatException('Invalid public key ASN.1 sequence.');
      }
      final keySequence = pkTop;

      if (keySequence.elements.length < 2) {
        throw FormatException(
          'Public key sequence does not have enough elements.',
        );
      }

      final modulus =
          (keySequence.elements[0] as ASN1Integer).valueAsBigInteger;
      final exponent =
          (keySequence.elements[1] as ASN1Integer).valueAsBigInteger;

      return RSAPublicKey(modulus, exponent);
    } else if (topLevelSeq.elements.length == 9) {
      final modulus =
          (topLevelSeq.elements[1] as ASN1Integer).valueAsBigInteger;
      final privateExponent =
          (topLevelSeq.elements[3] as ASN1Integer).valueAsBigInteger;
      final p = (topLevelSeq.elements[4] as ASN1Integer).valueAsBigInteger;
      final q = (topLevelSeq.elements[5] as ASN1Integer).valueAsBigInteger;

      return RSAPrivateKey(modulus, privateExponent, p, q);
    } else if (topLevelSeq.elements.length >= 3 &&
        topLevelSeq.elements[2] is ASN1OctetString) {
      final octet = topLevelSeq.elements[2] as ASN1OctetString;
      final innerBytes = octet.valueBytes();

      final innerParser = ASN1Parser(innerBytes);
      final innerTop = innerParser.nextObject();
      if (innerTop is! ASN1Sequence) {
        throw FormatException('Inner private key is not a sequence.');
      }

      final pkSeq = innerTop;

      if (pkSeq.elements.length < 9) {
        throw FormatException('Unexpected PKCS#1 private key structure.');
      }

      final modulus = (pkSeq.elements[1] as ASN1Integer).valueAsBigInteger;
      final privateExponent =
          (pkSeq.elements[3] as ASN1Integer).valueAsBigInteger;
      final p = (pkSeq.elements[4] as ASN1Integer).valueAsBigInteger;
      final q = (pkSeq.elements[5] as ASN1Integer).valueAsBigInteger;

      return RSAPrivateKey(modulus, privateExponent, p, q);
    } else {
      throw FormatException(
        'Invalid or unsupported PEM format. Top-level sequence has ${topLevelSeq.elements.length} elements.',
      );
    }
  }

  Uint8List _hexToBytes(String hex) {
    final cleanHex = hex.replaceAll(RegExp(r'[^0-9A-Fa-f]'), '');
    final length = cleanHex.length;
    final result = Uint8List(length ~/ 2);
    for (var i = 0; i < length; i += 2) {
      result[i ~/ 2] = int.parse(cleanHex.substring(i, i + 2), radix: 16);
    }
    return result;
  }

  Uint8List _stripBitStringPadding(ASN1BitString bstr) {
    final raw = bstr.valueBytes();

    if (raw.isEmpty) {
      throw FormatException('Empty BIT STRING in public key.');
    }

    return Uint8List.fromList(raw.sublist(1));
  }
}

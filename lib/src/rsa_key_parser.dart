import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:asn1lib/asn1lib.dart';

/// Parses PEM-formatted RSA public/private keys into PointyCastle key objects.
///
/// Supports:
/// 1. PKCS#8 Public Keys (SubjectPublicKeyInfo structure, BEGIN PUBLIC KEY)
/// 2. PKCS#1 Private Keys (BEGIN RSA PRIVATE KEY)
/// 3. PKCS#8 Private Keys (PrivateKeyInfo wrapping an OCTET STRING that contains the PKCS#1 RSA private key) - BEGIN PRIVATE KEY
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

    // ----- Case 1: PKCS#8 Public Key (SubjectPublicKeyInfo)
    // SubjectPublicKeyInfo ::= SEQUENCE { algorithm AlgorithmIdentifier, subjectPublicKey BIT STRING }
    // -> sequence of length 2 where element 1 is a BIT STRING containing an embedded PKCS#1 public key
    if (topLevelSeq.elements.length == 2 &&
        topLevelSeq.elements[1] is ASN1BitString) {
      final publicKeyBitString = topLevelSeq.elements[1] as ASN1BitString;

      // ASN.1 BIT STRING encodes the number of unused bits as the first byte,
      // so drop that byte before parsing the embedded structure.
      final pubKeyBytes = _stripBitStringPadding(publicKeyBitString);

      final pkParser = ASN1Parser(pubKeyBytes);
      final pkTop = pkParser.nextObject();
      if (pkTop is! ASN1Sequence) {
        throw FormatException('Invalid public key ASN.1 sequence.');
      }
      final keySequence = pkTop;

      // Expecting Sequence { modulus, publicExponent }
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
    }
    // ----- Case 2: PKCS#1 Private Key (BEGIN RSA PRIVATE KEY)
    // Traditional RSA private key format has 9 elements
    else if (topLevelSeq.elements.length == 9) {
      // Sequence { version, modulus, publicExponent, privateExponent, p, q, dP, dQ, qInv }
      final modulus =
          (topLevelSeq.elements[1] as ASN1Integer).valueAsBigInteger;
      final privateExponent =
          (topLevelSeq.elements[3] as ASN1Integer).valueAsBigInteger;
      final p = (topLevelSeq.elements[4] as ASN1Integer).valueAsBigInteger;
      final q = (topLevelSeq.elements[5] as ASN1Integer).valueAsBigInteger;

      return RSAPrivateKey(modulus, privateExponent, p, q);
    }
    // ----- Case 3: PKCS#8 Private Key (BEGIN PRIVATE KEY)
    // PrivateKeyInfo ::= SEQUENCE { version, privateKeyAlgorithm, privateKey OCTET STRING, ... }
    // The OCTET STRING contains the PKCS#1 RSA private key sequence; unwrap and parse it.
    else if (topLevelSeq.elements.length >= 3 &&
        topLevelSeq.elements[2] is ASN1OctetString) {
      final octet = topLevelSeq.elements[2] as ASN1OctetString;
      final innerBytes = octet.valueBytes();

      final innerParser = ASN1Parser(innerBytes);
      final innerTop = innerParser.nextObject();
      if (innerTop is! ASN1Sequence) {
        throw FormatException('Inner private key is not a sequence.');
      }

      final pkSeq = innerTop;
      // Expect PKCS#1 private key sequence (9 elements)
      if (pkSeq.elements.length < 9) {
        throw FormatException('Unexpected PKCS#1 private key structure.');
      }

      final modulus = (pkSeq.elements[1] as ASN1Integer).valueAsBigInteger;
      final privateExponent =
          (pkSeq.elements[3] as ASN1Integer).valueAsBigInteger;
      final p = (pkSeq.elements[4] as ASN1Integer).valueAsBigInteger;
      final q = (pkSeq.elements[5] as ASN1Integer).valueAsBigInteger;

      return RSAPrivateKey(modulus, privateExponent, p, q);
    }
    // ----- Unsupported
    else {
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

  /// Remove PEM armor and base64-decode into DER bytes.
  Uint8List _decodePEM(String pem) {
    // Normalize line endings and split into lines
    final lines = pem.replaceAll('\r\n', '\n').split('\n');

    // Remove header/footer lines and empty lines. Trim each line first so
    // lines with leading/trailing whitespace are handled.
    final filtered = lines
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty && !l.startsWith('-----'))
        .toList();

    if (filtered.isEmpty) {
      throw FormatException('PEM data is empty or only contained headers.');
    }

    final base64Str = filtered.join('');
    try {
      return base64.decode(base64Str);
    } catch (e) {
      throw FormatException('PEM base64 decoding failed: $e');
    }
  }

  /// ASN1BitString stores a leading byte that is the number of unused bits in the final byte.
  /// Return the raw bytes of the embedded object by skipping that first padding byte.
  Uint8List _stripBitStringPadding(ASN1BitString bstr) {
    // Two ways to get the underlying bytes depending on version of asn1lib:
    // - valueBytes() returns the raw value bytes (including the leading unused-bits byte)
    // - contentBytes() also may exist in some versions; valueBytes() is common
    final raw = bstr.valueBytes();

    if (raw.isEmpty) {
      throw FormatException('Empty BIT STRING in public key.');
    }

    // First byte = number of unused bits, remainder is the actual payload
    return Uint8List.fromList(raw.sublist(1));
  }
}

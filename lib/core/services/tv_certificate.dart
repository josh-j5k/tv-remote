import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:android_tv_remote/core/services/models/generate_client_certificate.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';
import 'package:android_tv_remote/src/rsa_key_parser.dart';
import 'package:basic_utils/basic_utils.dart';

class TvCertificate {
  const TvCertificate();
  Future<GenerateClientCertificate> generateClientCertificate(
    String deviceId,
    String host,
  ) async {
    final rsaParams = RSAKeyGeneratorParameters(
      BigInt.parse('65537'),
      2048,
      64,
    );
    final random = FortunaRandom();
    final seed = Uint8List.fromList(
      List.generate(32, (i) => Random.secure().nextInt(256)),
    );
    random.seed(KeyParameter(seed));

    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(rsaParams, random));
    final keyPair = keyGen.generateKeyPair();

    final clientPublicKey = keyPair.publicKey as RSAPublicKey;
    final clientPrivateKey = keyPair.privateKey as RSAPrivateKey;

    // Generate certificate
    final certPem = _generateX509Certificate(
      deviceId,
      clientPrivateKey,
      clientPublicKey,
    );
    final keyPem = _generatePrivateKeyPEM(clientPrivateKey, clientPublicKey);

    // Save to temp files
    final certPath = '${Directory.systemTemp.path}/atv_cert_$host.pem';
    final keyPath = '${Directory.systemTemp.path}/atv_key_$host.pem';

    await File(certPath).writeAsString(certPem, flush: true);
    await File(keyPath).writeAsString(keyPem, flush: true);

    return GenerateClientCertificate(
      certPath: certPath,
      clientPrivateKey: clientPrivateKey,
      clientPublicKey: clientPublicKey,
      keyPath: keyPath,
    );
  }

  Future<(RSAPrivateKey, RSAPublicKey)> extractKeysFromCert(
    String certPem,
    String keyPem,
  ) async {
    try {
      final clientPrivateKey = _parsePrivateKeyFromPem(keyPem);
      final parsed = X509Utils.x509CertificateFromPem(certPem);

      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type
      final key = _parsePublicKey(pubKeyData.bytes!);
      return (clientPrivateKey, key);
    } catch (e, st) {
      print('❌ Error extracting keys: $e');
      print('Stack trace: $st\n');

      rethrow;
    }
  }

  String _generateX509Certificate(
    String deviceId,
    RSAPrivateKey clientPrivateKey,
    RSAPublicKey clientPublicKey,
  ) {
    final tbsCertificate = ASN1Sequence();
    final version = ASN1Sequence(tag: 0xA0);
    version.add(ASN1Integer(BigInt.from(2)));
    tbsCertificate.add(version);
    final serialNumber = BigInt.from(DateTime.now().millisecondsSinceEpoch);
    tbsCertificate.add(ASN1Integer(serialNumber));
    final signatureAlgorithm = ASN1Sequence();
    signatureAlgorithm.add(
      ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 11]),
    ); // sha256WithRSAEncryption
    signatureAlgorithm.add(ASN1Null());
    tbsCertificate.add(signatureAlgorithm);

    // Issuer (CN=atvremote)
    final issuer = _buildDistinguishedName('atvremote-$deviceId');
    tbsCertificate.add(issuer);

    // Validity
    final now = DateTime.now().toUtc();
    final notAfter = now.add(Duration(days: 3650));
    final validity = ASN1Sequence();
    validity.add(ASN1UtcTime(now));
    validity.add(ASN1UtcTime(notAfter));
    tbsCertificate.add(validity);
    tbsCertificate.add(issuer);
    final subjectPublicKeyInfo = _buildPublicKeyInfo(
      clientPublicKey.modulus!,
      clientPublicKey.exponent!,
    );
    tbsCertificate.add(subjectPublicKeyInfo);
    final extensions = _buildExtensions();
    tbsCertificate.add(extensions);
    final tbsBytes = tbsCertificate.encodedBytes;
    final signature = _signData(tbsBytes, clientPrivateKey);
    final certificate = ASN1Sequence();
    certificate.add(tbsCertificate);
    certificate.add(signatureAlgorithm);
    certificate.add(ASN1BitString(signature));
    final certBytes = certificate.encodedBytes;
    return _toPem(certBytes, 'CERTIFICATE');
  }

  String _generatePrivateKeyPEM(
    RSAPrivateKey clientPrivateKey,
    RSAPublicKey clientPublicKey,
  ) {
    final privateKeySeq = ASN1Sequence();
    privateKeySeq.add(ASN1Integer(BigInt.zero)); // version = 0

    privateKeySeq.add(ASN1Integer(clientPrivateKey.modulus!));
    privateKeySeq.add(ASN1Integer(clientPrivateKey.publicExponent!));
    privateKeySeq.add(ASN1Integer(clientPrivateKey.privateExponent!));
    privateKeySeq.add(ASN1Integer(clientPrivateKey.p!));
    privateKeySeq.add(ASN1Integer(clientPrivateKey.q!));

    final exp1 =
        clientPrivateKey.privateExponent! % (clientPrivateKey.p! - BigInt.one);
    privateKeySeq.add(ASN1Integer(exp1));

    final exp2 =
        clientPrivateKey.privateExponent! % (clientPrivateKey.q! - BigInt.one);
    privateKeySeq.add(ASN1Integer(exp2));

    final coefficient = clientPrivateKey.q!.modInverse(clientPrivateKey.p!);
    privateKeySeq.add(ASN1Integer(coefficient));

    // Encode the ASN.1 sequence (this is PKCS#1 DER)
    final pkcs1Bytes = privateKeySeq.encodedBytes;
    final base64String = base64.encode(pkcs1Bytes);

    // Wrap in PEM header/footer
    final buffer = StringBuffer();
    buffer.writeln('-----BEGIN RSA PRIVATE KEY-----');

    for (var i = 0; i < base64String.length; i += 64) {
      final end = (i + 64 < base64String.length) ? i + 64 : base64String.length;
      buffer.writeln(base64String.substring(i, end));
    }

    buffer.write('-----END RSA PRIVATE KEY-----');

    return buffer.toString();
  }

  RSAPublicKey extractServerPublicKey(X509Certificate cert) {
    try {
      final parsed = X509Utils.x509CertificateFromPem(cert.pem);

      final pubKeyData = parsed.tbsCertificate!.subjectPublicKeyInfo; // type
      final key = _parsePublicKey(pubKeyData.bytes!);

      return key;
    } catch (e, st) {
      print('Error extracting server public key: $e\n$st');
      rethrow;
    }
  }

  RSAPublicKey _parsePublicKey(String pem) {
    final parser = RSAKeyParser();
    return parser.parse(pem) as RSAPublicKey;
  }

  RSAPrivateKey _parsePrivateKeyFromPem(String keyPem) {
    // Remove PEM headers and decode base64
    final keyContent = keyPem
        .replaceAll('-----BEGIN RSA PRIVATE KEY-----', '')
        .replaceAll('-----END RSA PRIVATE KEY-----', '')
        .replaceAll('-----BEGIN PRIVATE KEY-----', '')
        .replaceAll('-----END PRIVATE KEY-----', '')
        .replaceAll('\n', '')
        .replaceAll('\r', '')
        .trim();

    final keyBytes = base64.decode(keyContent);

    // Parse ASN.1 structure
    final asn1Parser = ASN1Parser(keyBytes);
    final topLevelSeq = asn1Parser.nextObject() as ASN1Sequence;

    if (topLevelSeq.elements.length == 9) {
      // PKCS#1 format
      return _parsePKCS1PrivateKey(topLevelSeq);
    } else if (topLevelSeq.elements.length == 3) {
      // PKCS#8 format - extract the inner PKCS#1 key
      final privateKeyOctetString = topLevelSeq.elements[2] as ASN1OctetString;
      final innerParser = ASN1Parser(privateKeyOctetString.octets);
      final innerSeq = innerParser.nextObject() as ASN1Sequence;
      return _parsePKCS1PrivateKey(innerSeq);
    } else {
      throw FormatException('Unknown private key format');
    }
  }

  RSAPrivateKey _parsePKCS1PrivateKey(ASN1Sequence sequence) {
    final modulus = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;
    final privateExponent =
        (sequence.elements[3] as ASN1Integer).valueAsBigInteger;
    final p = (sequence.elements[4] as ASN1Integer).valueAsBigInteger;
    final q = (sequence.elements[5] as ASN1Integer).valueAsBigInteger;

    return RSAPrivateKey(modulus, privateExponent, p, q);
  }
}

String _toPem(Uint8List bytes, String label) {
  final base64String = base64.encode(bytes);
  final lines = <String>[];

  // Split into 64-character lines
  for (var i = 0; i < base64String.length; i += 64) {
    final end = (i + 64 < base64String.length) ? i + 64 : base64String.length;
    lines.add(base64String.substring(i, end));
  }

  return '-----BEGIN $label-----\n${lines.join('\n')}\n-----END $label-----';
}

ASN1Sequence _buildDistinguishedName(String commonName) {
  final dn = ASN1Sequence();
  final cnSet = ASN1Set();
  final cnSequence = ASN1Sequence();
  cnSequence.add(ASN1ObjectIdentifier([2, 5, 4, 3]));
  cnSequence.add(ASN1UTF8String(commonName));
  cnSet.add(cnSequence);
  dn.add(cnSet);

  return dn;
}

ASN1Sequence _buildPublicKeyInfo(BigInt clientPubMod, BigInt clientPubExpo) {
  final publicKeySeq = ASN1Sequence();

  // Algorithm Identifier
  final algorithmSeq = ASN1Sequence();
  algorithmSeq.add(
    ASN1ObjectIdentifier([1, 2, 840, 113549, 1, 1, 1]),
  ); // rsaEncryption
  algorithmSeq.add(ASN1Null());
  publicKeySeq.add(algorithmSeq);

  // Public Key
  final publicKeyInnerSeq = ASN1Sequence();
  publicKeyInnerSeq.add(ASN1Integer(clientPubMod));
  publicKeyInnerSeq.add(ASN1Integer(clientPubExpo));

  final publicKeyBitString = ASN1BitString(publicKeyInnerSeq.encodedBytes);
  publicKeySeq.add(publicKeyBitString);

  return publicKeySeq;
}

ASN1Sequence _buildExtensions() {
  // Extensions with context tag [3]
  final extensionsWrapper = ASN1Sequence(tag: 0xA3);
  final extensions = ASN1Sequence();

  // Basic Constraints (CA:FALSE)
  final basicConstraints = ASN1Sequence();
  basicConstraints.add(
    ASN1ObjectIdentifier([2, 5, 29, 19]),
  ); // basicConstraints OID
  final basicConstraintsValue = ASN1Sequence();
  basicConstraintsValue.add(ASN1Boolean(false)); // CA:FALSE
  basicConstraints.add(ASN1OctetString(basicConstraintsValue.encodedBytes));
  extensions.add(basicConstraints);

  // Key Usage (Digital Signature, Key Encipherment)
  final keyUsage = ASN1Sequence();
  keyUsage.add(ASN1ObjectIdentifier([2, 5, 29, 15])); // keyUsage OID
  keyUsage.add(ASN1Boolean(true)); // Critical
  // Key usage bits: digitalSignature (0), keyEncipherment (2)
  final keyUsageBits = Uint8List.fromList([0xA0]); // 10100000 in binary
  final keyUsageValue = ASN1BitString(keyUsageBits, unusedbits: 3);
  keyUsage.add(ASN1OctetString(keyUsageValue.encodedBytes));
  extensions.add(keyUsage);

  extensionsWrapper.add(extensions);
  return extensionsWrapper;
}

Uint8List _signData(Uint8List data, RSAPrivateKey clientPrivateKey) {
  final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
  signer.init(true, PrivateKeyParameter<RSAPrivateKey>(clientPrivateKey));
  final signature = signer.generateSignature(data);
  return signature.bytes;
}

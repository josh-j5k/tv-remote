import 'package:pointycastle/export.dart';

class GenerateClientCertificate {
  final String certPath;
  final String keyPath;
  final RSAPublicKey clientPublicKey;
  final RSAPrivateKey clientPrivateKey;
  const GenerateClientCertificate({
    required this.certPath,
    required this.clientPrivateKey,
    required this.clientPublicKey,
    required this.keyPath,
  });
}

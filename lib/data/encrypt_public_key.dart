import 'dart:typed_data';
import 'dart:convert';
import 'package:cryptography/cryptography.dart';
// import 'package:cryptography/dart.dart';

// final _ecdh = Ecdh.p256(length: 32);
// final _hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);

// /// Generate ephemeral P-256 keypair and return (keyPair, publicKeyBytes)
// Future<Map<String, dynamic>> generateEphemeralKeypair() async {
//   final keyPair = await _ecdh.newKeyPair();
//   final pub = await keyPair.extractPublicKey();
//   // pub.bytes is the raw public key in x9.63 format (0x04 || X || Y)
//   final pubBytes = (pub as SimplePublicKey).bytes;
//   return {'keyPair': keyPair, 'publicKeyBytes': Uint8List.fromList(pubBytes)};
// }

// /// Compute ECDH shared secret (returns SecretKey)
// Future<SecretKey> computeSharedSecret(
//   KeyPair localKeyPair,
//   Uint8List remotePublicKeyBytes,
// ) async {
//   final remotePublicKey = SimplePublicKey(
//     remotePublicKeyBytes,
//     type: KeyPairType.p256,
//   );

//   final sharedSecret = await _ecdh.sharedSecretKey(
//     keyPair: localKeyPair,
//     remotePublicKey: remotePublicKey,
//   );
//   return sharedSecret; // a SecretKey
// }

// /// Derive AES key (32 bytes) via HKDF-SHA256 from ECDH shared secret
// Future<SecretKey> deriveAesKey(
//   SecretKey sharedSecret, {
//   List<int>? salt,
//   List<int>? info,
//   int length = 32,
// }) async {
//   // HKDF deriveKey produces a SecretKey suitable for AES-256 when length=32
//   final derived = await _hkdf.deriveKey(
//     secretKey: sharedSecret,
//     info: info ?? utf8.encode('android-tv-pairing'), // optional context
//     nonce: salt ?? [], // optional salt (use empty list if null)
//   );
//   return derived;
// }

// /// Example: Do full flow: generate ephemeral, compute shared, derive AES key, and return ephemeral public key bytes + AES key bytes
// Future<Map<String, dynamic>> createPairingSecretEnvelope({
//   required Uint8List
//   serverPublicKeyBytes, // remote public key (x9.63 uncompressed: 0x04 || X || Y)
//   List<int>? hkdfSalt,
//   List<int>? hkdfInfo,
// }) async {
//   // 1) generate ephemeral
//   final gen = await generateEphemeralKeypair();
//   final localKeyPair = gen['keyPair'] as KeyPair;
//   final localPubBytes = gen['publicKeyBytes'] as Uint8List;

//   // 2) compute shared secret
//   final sharedSecret = await computeSharedSecret(
//     localKeyPair,
//     serverPublicKeyBytes,
//   );

//   // 3) derive AES key (32 bytes)
//   final aesSecretKey = await deriveAesKey(
//     sharedSecret,
//     salt: hkdfSalt,
//     info: hkdfInfo,
//     length: 32,
//   );

//   // extract AES key bytes if needed
//   final aesBytes = await aesSecretKey.extractBytes();

//   return {
//     'localPublicKeyBytes': localPubBytes,
//     'aesKeyBytes': Uint8List.fromList(aesBytes),
//   };
// }
final _ecdh = X25519(); // cross-platform
final _hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);

/// generate ephemeral x25519 keypair + raw 32-byte public key
Future<Map<String, dynamic>> generateEphemeralKeypair() async {
  final keyPair = await _ecdh.newKeyPair();
  final pub = await keyPair.extractPublicKey();
  final pubBytes = pub.bytes; // 32 bytes
  return {'keyPair': keyPair, 'publicKeyBytes': Uint8List.fromList(pubBytes)};
}

/// compute shared secret from local keypair + remote raw 32-byte pubkey
Future<SecretKey> computeSharedSecret(
  KeyPair localKeyPair,
  Uint8List remotePublicKeyBytes,
) async {
  final remotePublicKey = SimplePublicKey(
    remotePublicKeyBytes,
    type: KeyPairType.x25519,
  );
  return await _ecdh.sharedSecretKey(
    keyPair: localKeyPair,
    remotePublicKey: remotePublicKey,
  );
}

/// HKDF derive AES-256
Future<SecretKey> deriveAesKey(
  SecretKey sharedSecret, {
  List<int>? salt,
  List<int>? info,
  int length = 32,
}) async {
  return await _hkdf.deriveKey(
    secretKey: sharedSecret,
    info: info ?? utf8.encode('android-tv-pairing'),
    nonce: salt ?? [],
  );
}

/// full envelope creator (same return shape as before)
Future<Map<String, dynamic>> createPairingSecretEnvelope({
  required Uint8List serverPublicKeyBytes,
  List<int>? hkdfSalt,
  List<int>? hkdfInfo,
}) async {
  final gen = await generateEphemeralKeypair();
  final localKeyPair = gen['keyPair'] as KeyPair;
  final localPubBytes = gen['publicKeyBytes'] as Uint8List;

  final sharedSecret = await computeSharedSecret(
    localKeyPair,
    serverPublicKeyBytes,
  );

  final aesSecretKey = await deriveAesKey(
    sharedSecret,
    salt: hkdfSalt,
    info: hkdfInfo,
    length: 32,
  );

  final aesBytes = await aesSecretKey.extractBytes();

  return {
    'localPublicKeyBytes': localPubBytes,
    'aesKeyBytes': Uint8List.fromList(aesBytes),
  };
}

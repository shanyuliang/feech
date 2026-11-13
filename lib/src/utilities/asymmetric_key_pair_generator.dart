import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';

AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRsaKeyPairSync(int bitLength) {
  final random = Random.secure();
  final seed = Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));
  final secureRandom = FortunaRandom()..seed(KeyParameter(seed));
  final generator = RSAKeyGenerator()..init(ParametersWithRandom(RSAKeyGeneratorParameters(BigInt.parse('65537'), bitLength, 64), secureRandom));
  return generator.generateKeyPair();
}

Future<AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>> generateRsaKeyPairAsync(int bitLength) async {
  return compute(generateRsaKeyPairSync, bitLength);
}

Future<SimpleKeyPair> generateEd25519KeyPairAsync() async {
  return Ed25519().newKeyPair();
}

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';

AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRsaKeyPair(int bits) {
  final random = Random.secure();
  final seed = Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));
  final secureRandom = FortunaRandom()..seed(KeyParameter(seed));
  final generator = RSAKeyGenerator()..init(ParametersWithRandom(RSAKeyGeneratorParameters(BigInt.parse('65537'), bits, 64), secureRandom));
  return generator.generateKeyPair();
}

Future<AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>> generateRsaKeyPairAsync(int bits) async {
  return compute(generateRsaKeyPair, bits);
}

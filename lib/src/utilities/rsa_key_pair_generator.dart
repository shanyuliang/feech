import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRsaKeyPair({int bits = 4096}) {
  final random = Random.secure();
  final seed = Uint8List.fromList(List<int>.generate(32, (_) => random.nextInt(256)));
  final secureRandom = FortunaRandom()..seed(KeyParameter(seed));
  final generator = RSAKeyGenerator()..init(ParametersWithRandom(RSAKeyGeneratorParameters(BigInt.parse('65537'), bits, 64), secureRandom));
  return generator.generateKeyPair();
}

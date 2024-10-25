import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'GEOCODING_API_KEY', obfuscate: true)
  static final String geocodingApiKey = _Env.geocodingApiKey;
}
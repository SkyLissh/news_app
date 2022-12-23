import "package:envied/envied.dart";

part "env.g.dart";

@Envied()
abstract class Env {
  @EnviedField(varName: "NEWSAPI_KEY", obfuscate: true)
  static final newsApiKey = _Env.newsApiKey;
}

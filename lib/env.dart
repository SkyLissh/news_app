import "package:envied/envied.dart";

part "env.g.dart";

@Envied()
abstract class Env {
  @EnviedField(varName: "NEWS_KEY", obfuscate: true)
  static final newsKey = _Env.newsKey;
}

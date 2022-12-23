import "package:freezed_annotation/freezed_annotation.dart";
import "package:firebase_auth/firebase_auth.dart" as auth;

part "user.freezed.dart";
part "user.g.dart";

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirebaseUser({
    required auth.User user,
    required String name,
  }) =>
      User(
        id: user.uid,
        name: name,
        email: user.email!,
        createdAt: DateTime.now(),
      );
}

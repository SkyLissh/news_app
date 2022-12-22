import "package:state_notifier/state_notifier.dart";

import "package:firebase_auth/firebase_auth.dart";

class AuthState {
  final bool invalidEmailOrPassword;
  final bool emailInUse;
  final bool weakPassword;

  AuthState({
    this.invalidEmailOrPassword = false,
    this.emailInUse = false,
    this.weakPassword = false,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final _auth = FirebaseAuth.instance;

  AuthNotifier() : super(AuthState());

  Future<UserCredential?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        state = AuthState(weakPassword: true);
      } else if (e.code == "email-already-in-use") {
        state = AuthState(emailInUse: true);
      }

      return null;
    }
  }

  Future<UserCredential?> logIn(
      {required String email, required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        state = AuthState(invalidEmailOrPassword: true);
      } else if (e.code == "wrong-password") {
        state = AuthState(invalidEmailOrPassword: true);
      }

      return null;
    }
  }

  void resetInvalid() {
    state = AuthState();
  }
}

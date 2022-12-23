import "package:state_notifier/state_notifier.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_database/firebase_database.dart";

import "package:news_app/models/models.dart" as models;

class AuthState {
  final models.User? user;

  final bool invalidEmailOrPassword;
  final bool emailInUse;
  final bool weakPassword;

  AuthState({
    this.user,
    this.invalidEmailOrPassword = false,
    this.emailInUse = false,
    this.weakPassword = false,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance;

  AuthNotifier() : super(AuthState());

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = models.User.fromFirebaseUser(
        user: cred.user!,
        name: name,
      );

      await _db.ref("users/${user.id}").set(user.toJson());

      state = AuthState(user: user);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        state = AuthState(weakPassword: true);
      } else if (e.code == "email-already-in-use") {
        state = AuthState(emailInUse: true);
      }

      return false;
    }
  }

  Future<bool> logIn({required String email, required String password}) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final ref = _db.ref("users/${cred.user!.uid}");

      ref.onValue.listen((event) {
        final user = models.User.fromJson(
          Map<String, dynamic>.from(event.snapshot.value as dynamic),
        );

        state = AuthState(user: user);
      });

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        state = AuthState(invalidEmailOrPassword: true);
      } else if (e.code == "wrong-password") {
        state = AuthState(invalidEmailOrPassword: true);
      }

      return false;
    }
  }

  Future<void> logOut() async {
    await _db.goOffline();
    await _auth.signOut();
    state = AuthState();
  }

  Future<bool> getUser() async {
    final user = _auth.currentUser;

    if (user != null && state.user == null) {
      final ref = _db.ref("users/${user.uid}");

      ref.onValue.listen((event) {
        final user = models.User.fromJson(
          Map<String, dynamic>.from(event.snapshot.value as dynamic),
        );

        state = AuthState(user: user);
      });
    }

    return user != null;
  }

  void resetInvalid() {
    state = AuthState();
  }
}

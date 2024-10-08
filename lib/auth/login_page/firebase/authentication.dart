import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<UserCredential> signIn(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential;
  }

  Future<void> signOut() async => _firebaseAuth.signOut();

  Future<void> signUp() async {}

  Future<bool> isSigned() async => _firebaseAuth.currentUser != null;
}

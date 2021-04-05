import 'package:firebase_auth/firebase_auth.dart';

// interface implementation
abstract class AuthBase {
  User get currentUser;
  Stream<User> authStateChanges();
  Future<User> signInGuest();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<User> signInGuest() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

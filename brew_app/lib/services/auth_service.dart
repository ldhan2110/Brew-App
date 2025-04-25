import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuthModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserAuthModel(uid: user.uid) : null;
  }

  Stream<UserAuthModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<UserAuthModel?> signinAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      UserAuthModel? user = _userFromFirebaseUser(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserAuthModel?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserAuthModel? user = _userFromFirebaseUser(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}

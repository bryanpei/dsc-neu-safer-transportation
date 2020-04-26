import 'package:firebase_auth/firebase_auth.dart';
import 'package:safer_transportation/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on Firebase User
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }


  // auth change user stream
  // null value if user is logged out, else logged in.
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }
  // Sign in Anonymously, testing to see if Firebase works. This allows

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString() + "Hello");
      return null;
    }
  }


  // Sign in with Email and Password

  Future signInWithEmailAndPassWord(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register
  Future signUpWithEmailAndPassWord(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,
          password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
       return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


}
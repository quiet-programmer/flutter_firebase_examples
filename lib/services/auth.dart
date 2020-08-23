import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:tut_firebase/models/user.dart';
import 'package:tut_firebase/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserModel _userFromFirebaseuser(FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseuser(user));
        .map(_userFromFirebaseuser);
  }

  // signin anon
  Future anonSingin() async {
    try {
      AuthResult results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;
      return _userFromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin with email and password
  Future signInWithEmailAndPwd(String email, String pwd) async {
    try {
      AuthResult results =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user = results.user;
      return _userFromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPwd(String email, String pwd) async {
    try {
      AuthResult results = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      FirebaseUser user = results.user;

      // create a new document for the user with the uid.
      await DatabaseService(uid: user.uid)
          .updateUserData('', 'another brew member', 100);
      return _userFromFirebaseuser(user);
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == "ERROR_EMAIL_ALREADY_IN_USE") {
          print("The email address is already in use by another account");
        }
      }
      print(signUpError.toString());
      return null;
    }
  }

  // sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

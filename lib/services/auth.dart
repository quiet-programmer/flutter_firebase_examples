import 'package:firebase_auth/firebase_auth.dart';
import 'package:tut_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserModel _userFromFirebaseuser(FirebaseUser user) {
    return user != null ? UserModel(uid: user.uid) : null;
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

  // register with email and password

  // sign out
}

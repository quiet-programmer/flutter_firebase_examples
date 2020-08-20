import 'package:flutter/material.dart';
import 'package:tut_firebase/services/auth.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthService _userAuth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brew Crew Signin"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () async {
                    dynamic result = await _userAuth.anonSingin();
                    if (result == null) {
                      print("Error: Could not sign user in");
                    } else {
                      print("User signed in");
                      print(result.uid);
                    }
                  },
                  child: Text("Sign-in Anon"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

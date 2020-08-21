import 'package:flutter/material.dart';
import 'package:tut_firebase/services/auth.dart';
import 'package:tut_firebase/shared/loading.dart';

class SigninScreen extends StatefulWidget {
  final Function toggleView;

  SigninScreen({this.toggleView});
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthService _userAuth = AuthService();

  final _scaffoldState = GlobalKey<ScaffoldState>();
  final _formState = GlobalKey<FormState>();

  String email = "";
  String pwd = "";
  String error = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            key: _scaffoldState,
            appBar: AppBar(
              title: Text("Brew Crew Signin"),
              actions: [
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text("Register"),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Center(
                  child: Form(
                    key: _formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Email is empty";
                            } else if (!val.contains("@")) {
                              return "Please enter a valid email";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Enter a Password";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              pwd = val;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (_formState.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result = await _userAuth
                                  .signInWithEmailAndPwd(email, pwd);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "Something went wrong, could not sign in(check interter Provider)";
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        FlatButton.icon(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            dynamic result = await _userAuth.anonSingin();
                            if (result == null) {
                              print("Error: Could not sign user in");
                            } else {
                              print("User signed in");
                              print(result.uid);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          icon: Icon(Icons.person_pin),
                          label: Text("Sign-in Anon"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

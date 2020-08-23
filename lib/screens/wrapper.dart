import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tut_firebase/auth/authenticate.dart';
import 'package:tut_firebase/models/user.dart';
import 'package:tut_firebase/screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    //return either home or authencate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:tut_firebase/auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authencate widget
    return Authenticate();
  }
}

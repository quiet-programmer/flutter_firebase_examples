import 'package:flutter/material.dart';
import 'package:tut_firebase/screens/wrapper.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Tutorial",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
      ),
      home: Wrapper(),
    );
  }
}

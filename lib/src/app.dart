import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tut_firebase/models/user.dart';
import 'package:tut_firebase/screens/wrapper.dart';
import 'package:tut_firebase/services/auth.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(
          value: AuthService().user,
        )
      ],
      child: MaterialApp(
        title: "Firebase Tutorial",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}

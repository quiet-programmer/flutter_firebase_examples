import 'package:flutter/material.dart';
import 'package:tut_firebase/models/brew.dart';
import 'package:tut_firebase/screens/brew_list.dart';
import 'package:tut_firebase/screens/settings_form.dart';
import 'package:tut_firebase/services/auth.dart';
import 'package:tut_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  GlobalKey _scaffoldState = GlobalKey<ScaffoldState>();

  void _showSettingsPanel() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: SettingsForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BrewModel>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text("Firebase Tut"),
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signout();
              },
              icon: Icon(Icons.person),
              label: Text("Sign out"),
            ),
            FlatButton.icon(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: BrewList(),
          ),
        ),
      ),
    );
  }
}

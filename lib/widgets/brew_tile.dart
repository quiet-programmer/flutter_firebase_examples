import 'package:flutter/material.dart';
import 'package:tut_firebase/models/brew.dart';

class BrewTile extends StatelessWidget {
  final BrewModel brew;

  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugars}"),
        ),
      ),
    );
  }
}

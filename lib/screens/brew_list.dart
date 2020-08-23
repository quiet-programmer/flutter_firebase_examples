import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tut_firebase/models/brew.dart';
import 'package:tut_firebase/widgets/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>>(context) ?? [];
    return ListView.builder(
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: brews.length,
      itemBuilder: (_, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}

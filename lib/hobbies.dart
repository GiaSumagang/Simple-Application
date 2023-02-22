import 'package:flutter/material.dart';
import 'package:profile/constants.dart';
import 'package:profile/hobbymodels.dart';

class Hobbies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> hobbies = [
      'Reading',
      'Playing video games',
      'Watching Movies',
      'Playing Instruments',
      'Discovering new music'

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('My Hobbies'),
        backgroundColor: Constants.primaryColor,
      ),
      body: HobbiesListView(hobbies: hobbies),
    );
  }
}

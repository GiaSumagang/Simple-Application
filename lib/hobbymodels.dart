import 'package:flutter/material.dart';

class HobbiesListView extends StatelessWidget {
  final List<String> hobbies;

  const HobbiesListView({required this.hobbies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hobbies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            hobbies[index],
            style: TextStyle(fontSize: 20.0),
          ),
          leading: Icon(Icons.favorite), // Replace with an appropriate icon
        );
      },
    );
  }
}

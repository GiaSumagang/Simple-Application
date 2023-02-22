import 'package:flutter/material.dart';
import 'package:profile/constants.dart';

class Details extends StatelessWidget {
  final List<String> platforms = [
    'Facebook',
    'Twitter',
    'Instagram',
    'LinkedIn',
    'WhatsApp'
  ];

   Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Platforms'),
        backgroundColor: Constants.primaryColor,
      ),
      body: ListView.builder(
        itemCount: platforms.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(platforms[index]),
              onTap: () {

              },
            ),
          );
        },
      ),
    );
  }
}

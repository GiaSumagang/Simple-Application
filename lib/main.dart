import 'package:flutter/material.dart';
import 'profilepage.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    title: 'sample',
    home: const ProfilePage(),
  ));
}
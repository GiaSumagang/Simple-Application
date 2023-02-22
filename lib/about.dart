import 'package:flutter/material.dart';
import 'package:profile/constants.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
      ),
      body: const Center(
        child:ListTile(
          title: Text("About Me",
        style: TextStyle(fontSize: 30.0),
    textAlign: TextAlign.start),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text("Hi, I am Gia C. Sumagang. I am 20 years old,"
                "and I lived in Sta. Elena, Iligan City. I am the "
                "oldest in child in our family, and I only have one sibling;her name is Keren Kezia Sumagang. "
                "I am also a student at USTP Cagayan de Oro majoring in information technology. "
                "My thoughts about this course are that it is really difficult; you need to be good at logic.",
                style: TextStyle(fontSize: 27.0),
                textAlign: TextAlign.justify),
          )),
        ),
    );
  }
}

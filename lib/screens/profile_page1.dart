
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profile/constants.dart';
import 'package:profile/detail.dart';
import 'package:profile/about.dart';
import 'package:profile/hobbies.dart';
import 'package:flutter/material.dart';


class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  int _selectedIndex = 0; // keep track of the selected tab

  static  List<Widget> _widgetOptions = <Widget>[    const Text('Profile Page'),    const Text('Favorites'),    const Text('Settings'),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // update the selected tab index
    });
  }

  final user = FirebaseAuth.instance.currentUser!;

  GlobalKey<FormState> key=GlobalKey();

  CollectionReference _reference=FirebaseFirestore.instance.collection('info-displayer');


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(side: BorderSide(color: Colors.white)),
              ),
            ),
            child: const Icon(Icons.exit_to_app,
                color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        children: [coverImage(), profile(), about(context), hobby(context), socmed(context)],
      ),
    );
  }
}

Widget coverImage(){
  return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(''),
          )
));
}

String? imageUrl;

Widget profile(){
  return Container(
    transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: -0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/gia.jpg'),
                  ),
                ),
              ),

              Text(
                "BSIT-R31",
                style: TextStyle(
                    color: Constants.textColor,
                    fontSize: 23),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
              "Giya",
              style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                  color: Constants.textColor
              )),
          const SizedBox(height: 5),
          Text(
              "Gia C. Sumagang",
              style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.w300,
                  color: Constants.textColor
              )),
          const SizedBox(height: 10),
          Row(
              children: const [
                Text("20 ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
                Text("Years Old",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w200
                  ),
                )
              ]
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.location_on_outlined, size: 15),
              Text("Sta. Elena, Iligan City",
                  style: TextStyle(
                      fontSize: 15))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.calendar_month_outlined, size: 15),
              Text("Birthdate August 30, 2002",
                  style: TextStyle(
                      fontSize: 15))
            ],
          )
        ]),
  );
}

Widget about(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: Constants.textColor
    ),
    onPressed: () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    },
    child: const ListTile(
        title: Text(
          'About Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blueGrey,
          ),
        ),
        subtitle: Text('Click to see more..')
    ),
  );
}

Widget hobby(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: Constants.textColor
    ),
    onPressed: () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Hobbies()),
      );
    },
    child: const ListTile(
      title: Text(
        'My Hobbies',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blueGrey,
        ),
      ),
      subtitle: Text('Click to see more..'),
    ),
  );
}

Widget socmed(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: Constants.textColor
    ),
    onPressed: () async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Details()),
      );
    },
    child: const ListTile(
        title: Text(
          'Social Medias',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blueGrey,
          ),
        ),
        subtitle: Text('Click to see more..')
    ),
  );
}





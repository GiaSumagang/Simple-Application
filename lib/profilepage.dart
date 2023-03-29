import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/constants.dart';
import 'package:profile/detail.dart';
import 'package:profile/about.dart';
import 'package:profile/hobbies.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; // keep track of the selected tab

  static  List<Widget> _widgetOptions = <Widget>[    const Text('Profile Page'),    const Text('Favorites'),    const Text('Settings'),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // update the selected tab index
    });
  }

  final user = FirebaseAuth.instance.currentUser!;

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
            child: const Text("Log Out", style: TextStyle(color: Colors.white)),
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
            image: AssetImage('assets/images/cover.jpg'),
          )
      ));
}

Widget profile(){
  return Container(
    transform: Matrix4.translationValues(0.0, -40.0, 0.0),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: -0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            iconSize: 100,
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              ImagePicker imagePicker=ImagePicker();
              imagePicker.pickImage(source: ImageSource.camera);
            },
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






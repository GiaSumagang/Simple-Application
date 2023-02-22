import 'package:flutter/material.dart';
import 'package:profile/constants.dart';
import 'package:profile/detail.dart';
import 'package:profile/about.dart';
import 'package:profile/hobbies.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; // keep track of the selected tab

  static const List<Widget> _widgetOptions = <Widget>[    Text('Profile Page'),    Text('Favorites'),    Text('Settings'),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
        children: [coverImage(), profile(), about(context), hobby(context), socmed(context)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // pass in the selected tab index
        onTap: _onItemTapped, // handle tab selection
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
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
          const CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 50,
              child: CircleAvatar(
                radius: 47,
                backgroundImage: AssetImage('assets/images/gia.jpg'),
              )),
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






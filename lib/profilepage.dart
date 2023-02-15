import 'package:flutter/material.dart';
import 'package:profile/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primaryColor.withOpacity(0.75),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
        children: [coverImage(), profile(), about(), hobby(), socmed()],
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

Widget about(){
  return Card(
    elevation: 80.0,
    color: Constants.secondaryColor,
    child: const ListTile(
      title: Text('About Me',
      style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 20, color: Colors.amber),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text('Hi, I am Gia C. Sumagang.'
        'I am 20 years old, and I live in Sta. Elena, Iligan City. '
        'I am the youngest in my family, and I only have one sibling; her name is Keren Kezia C. Sumagang.'
        'I am also a student here at USTP Cagayan de Oro, majoring in information technology. '
        'My thoughts about this course are that it is really difficult; you need to be good at logic, and since there is a never-ending programming language, you cannot just focus on one language.'
            ,style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 17,
              color: Colors.white,
              letterSpacing: 1)
        ),
      ),
    ),
  );
}

Widget hobby(){
  return Card(
    elevation: 80.0,
    color: Constants.textColor,
    child: const ListTile(
      title: Text('My Hobbies',
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20, color: Colors.blueGrey),
      ),
      subtitle: Text('- Watching Movies,                                                         - Discovering New Music,                                                - Playing Video Games                                                         - Arts',
          style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 17,
          color: Colors.black45,
          letterSpacing: 1),
    ),
  ));
}

Widget socmed(){
  return Card(
    elevation: 80.0,
    color: Constants.thirdColor,
    child: const ListTile(
      title: Text('Social Media',
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20, color: Colors.white),
      ),
      subtitle: Text("Twitter: Giya1908                                  Instagram: Giash.ii                                                    Facebook: Gia Sumagang",
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              color: Colors.white,
              letterSpacing: 1)),
    ),
  );
}






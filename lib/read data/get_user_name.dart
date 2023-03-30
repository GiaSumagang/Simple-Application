import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetUserName extends StatelessWidget {
  
  final String documentId;
  
  GetUserName({required this.documentId});
  @override
  Widget build(BuildContext context) {

    CollectionReference Users = FirebaseFirestore.instance.collection('Users');


    return FutureBuilder<DocumentSnapshot>(
      future: Users.doc(documentId).get(),
        builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('Full Name: ${data['Full Name']}');
      }
      return const Text('loading...');
    }
    )
    );
  }
}
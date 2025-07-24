import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class getdata extends StatelessWidget {
  final String documentId;

  getdata({required this.documentId});


  @override
  Widget build(BuildContext context) {

    CollectionReference shoes = FirebaseFirestore.instance.collection('shoes');

    return FutureBuilder<DocumentSnapshot> (
        future: shoes.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['name']}');
          }
          return Text('Loading...');
        }),
    );
  }
}

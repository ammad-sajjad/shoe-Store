import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class about extends StatelessWidget {
  about({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        child: Center(child: Text('signed in as ' + user.email!)),
      ),
    );
  }
}

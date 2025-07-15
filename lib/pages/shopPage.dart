import 'package:flutter/material.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Shop PAGE",style: TextStyle(color: Colors.black),),

        ],
      ),
    );
  }
}

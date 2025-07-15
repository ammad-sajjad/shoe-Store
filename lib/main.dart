import 'package:flutter/material.dart';
import 'package:shoe_store/intro.dart';
void main() {
  runApp(const ShoeStore());
}

class ShoeStore extends StatelessWidget {
  const ShoeStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: introPage(),
    );
  }
}

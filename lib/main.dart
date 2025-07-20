import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/intro.dart';
import 'package:shoe_store/pages/cartPage.dart';

import 'models/cart.dart';
void main() {
  runApp(const ShoeStore());
}

class ShoeStore extends StatelessWidget {
  const ShoeStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
        create: (context) => Cart(),
        builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: introPage(),)
    );
  }
}

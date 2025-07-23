import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/intro.dart';
import 'package:shoe_store/pages/cartPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoe_store/pages/loginPage.dart';
import 'package:shoe_store/services/auth_state_change.dart';
import 'firebase_options.dart';
import 'models/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: authStateChange(),)
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/home.dart';
import 'package:shoe_store/intro.dart';
import '';
import 'package:shoe_store/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/shopPage.dart';

class authStateChange extends StatefulWidget {
  const authStateChange({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  State<authStateChange> createState() => _authStateChangeState();
}

class _authStateChangeState extends State<authStateChange> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder (
          stream: authService.AuthStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return home();
            } else {
              return introPage();
            }
          },
        );
      },
    );
  }
}

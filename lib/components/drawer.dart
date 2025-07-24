import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../pages/loginPage.dart';
import '../services/auth_service.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  String errorMessage = '';

  void logout() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      await authService.value.signout();

      Navigator.of(context).pop();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );


    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'Registration failed';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DrawerHeader(
              child: Image.asset(
                "assets/images/nike-logo.png",
                color: Colors.white,
              ),
            ),
          ),

          // Top buttons
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text("Home", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text("About", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Bottom "Sign Out" button
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text("Sign out", style: TextStyle(color: Colors.white)),
            onTap: logout,
          ),
        ],
      ),
    );

  }
}

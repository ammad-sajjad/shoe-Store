import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/components/navBar.dart';
import 'package:shoe_store/pages/cartPage.dart';
import 'package:shoe_store/pages/shopPage.dart';
import 'package:shoe_store/pages/loginPage.dart';
import 'package:shoe_store/services/auth_service.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const shop(),
    const cart()
  ];

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
    return Scaffold(
      bottomNavigationBar: navBar(onTabChange: (index)=>navigateBottomBar(index)),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black),
            );
          },
        ),
      ),
      drawer: Drawer(
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
      ),

      body: _pages[_selectedIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shoe_store/pages/cartPage.dart';
import 'package:shoe_store/pages/shopPage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<Widget> _pages = [const shop(), const cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
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
      body: _pages.first,
    );
  }
}

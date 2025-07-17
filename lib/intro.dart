import 'package:flutter/material.dart';
import 'package:shoe_store/home.dart';
import 'package:shoe_store/pages/shopPage.dart';

class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset(
                "assets/images/nike-logo.png",
                width: 300,
                height: 250,
              ),
            ),

            // title
            Text(
              "Fuel Your Drive",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),

            // sub title
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Move without limits in kicks that blend unstoppable drive with standout style",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: 50),

            // button
            GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  ),
              child: Container(
                padding: EdgeInsets.all(10),
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black,
                ),
                child: Text(
                  "Shop Now",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

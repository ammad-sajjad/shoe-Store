import 'package:flutter/material.dart';
import 'package:shoe_store/components/navBar.dart';
import 'package:shoe_store/components/shoeTile.dart';
import 'package:shoe_store/intro.dart';
import 'package:shoe_store/models/shoe.dart';

final List<shoe> Shoes = [
  shoe(name: "Giannis Freak 7", price: "115", image: "assets/images/shoe1.png", description: "Engineered for speed and support, perfect for dynamic court performance"),
  shoe(name: "Nike Romaleos 4", price: "200", image: "assets/images/shoe2.png", description: "Delivers unbeatable stability and power for heavy lifting sessions"),
  shoe(name: "Interact Run", price: "85", image: "assets/images/shoe3.png", description: "Soft, responsive cushioning built to keep you going on everyday runs"),
  shoe(name: "Nike Metcon 6", price: "110", image: "assets/images/shoe4.png", description: "Durable, breathable, and made to handle your toughest training workouts"),
];

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Search"), Icon(Icons.search)],
                    ),
                  ),
                ),
                Text(
                  "Everyone Flies.... Some Fly Longer Then Others",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 35),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot Picks",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => introPage()),
                      );
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 420,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                 return shoeTile(
                    Shoe: Shoes[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

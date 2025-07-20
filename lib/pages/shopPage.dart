import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/components/navBar.dart';
import 'package:shoe_store/components/shoeTile.dart';
import 'package:shoe_store/intro.dart';
import 'package:shoe_store/models/shoe.dart';
import 'package:shoe_store/models/cart.dart';

import 'cartPage.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  void addShoeToCart(shoe Shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(Shoe);

    showDialog(
      context: context,
      builder: (context) => Dialog(backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.green, size: 48),
              SizedBox(height: 16),
              Text(
                "Added to cart!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Your item has been successfully added.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Scaffold(
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
                              MaterialPageRoute(
                                builder: (context) => introPage(),
                              ),
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
                        shoe Shoe = value.getShoeList()[index];

                        return shoeTile(
                          onTap: () => addShoeToCart(Shoe),
                          Shoe: Shoe,
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      top: 23,
                      right: 25,
                    ),
                    child: Divider(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

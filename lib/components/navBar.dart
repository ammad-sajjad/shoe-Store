import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoe_store/home.dart';
import 'package:shoe_store/pages/cartPage.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';


class navBar extends StatelessWidget {
  void Function(int)? onTabChange;
  navBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(right: 25),
     child: Stack(
        children: [
          GNav(
            color: Colors.grey[400],
            activeColor: Colors.grey.shade700,
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade100,
            tabBorderRadius: 18,
            onTabChange: (value) => onTabChange!(value),
            mainAxisAlignment: MainAxisAlignment.center,
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.shopping_cart, text: "Cart"),
            ],
          ),

          // Positioned badge on the cart icon (adjust right/bottom to your layout)
          Positioned(
            right: 90, // tweak this to align with cart icon
            bottom: 35,
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                int itemCount = cart.getUserCart().length;
                return itemCount > 0
                    ? Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    '$itemCount',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
                    : SizedBox.shrink();
              },
            ),
          ),
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoe_store/home.dart';
import 'package:shoe_store/pages/cartPage.dart';



class navBar extends StatelessWidget {
  void Function(int)? onTabChange;
  navBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 18,
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
          tabs: [
        GButton(icon: Icons.home,text: "Home",),
        GButton(icon: Icons.shopping_cart,text: "Cart"),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cartItem.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      shoe individualShoe = value.getUserCart()[index];

                      return CartItem(Shoe: individualShoe);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

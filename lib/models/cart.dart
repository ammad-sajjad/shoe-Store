import 'package:flutter/material.dart';
import 'shoe.dart'; // your model

class Cart extends ChangeNotifier {

  final List<shoe> shoeShop = [
    shoe(
      name: "Giannis Freak 7",
      price: 115,
      image: "assets/images/shoe1.png",
      description: "Engineered for speed and support, perfect for dynamic court performance",
    ),
    shoe(
      name: "Nike Romaleos 4",
      price: 200,
      image: "assets/images/shoe2.png",
      description: "Delivers unbeatable stability and power for heavy lifting sessions",
    ),
    shoe(
      name: "Interact Run",
      price: 85,
      image: "assets/images/shoe3.png",
      description: "Soft, responsive cushioning built to keep you going on everyday runs",
    ),
    shoe(
      name: "Nike Metcon 6",
      price: 110,
      image: "assets/images/shoe4.png",
      description: "Durable, breathable, and made to handle your toughest training workouts",
    ),
  ];

  List<shoe> userCart = [];

  List<shoe> getShoeList()  {
   return shoeShop;
  }

  List<shoe> getUserCart(){
  return userCart;
}


  void addItemToCart(shoe Shoe) {
    userCart.add(Shoe);
    notifyListeners();
  }

  void removeItemFromCart(shoe Shoe) {
    userCart.remove(Shoe);
    notifyListeners();
  }

  }
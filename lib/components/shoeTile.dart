import 'package:flutter/material.dart';
import 'package:shoe_store/models/shoe.dart';

class shoeTile extends StatelessWidget {
  shoe Shoe;

  shoeTile({super.key, required this.Shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 25),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // img shoe
          ClipRRect(
            child: Align(
              heightFactor: 0.5,
              child: Image.asset(Shoe.image, height: 370, width: 270),
            ),
          ),

          // description
          Text(
            Shoe.description,textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      Shoe.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  // Price
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      "\$" + Shoe.price,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Container(
                width: 65,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),

          // Add to cart button
        ],
      ),
    );
  }
}

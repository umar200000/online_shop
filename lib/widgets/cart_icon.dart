import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../screens/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final length = Provider.of<Products>(context).cartItems.length;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          icon: const Icon(
            Icons.shopping_bag_outlined,
          ),
        ),
        Positioned(
            right: 10,
            top: 8,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
              child: Center(
                child: Text(
                  length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

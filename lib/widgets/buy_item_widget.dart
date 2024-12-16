import 'package:flutter/material.dart';
import 'package:homework_8/provider/orders.dart';
import 'package:homework_8/provider/products.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';

class BuyItemWidget extends StatelessWidget {
  final String money;
  const BuyItemWidget({required this.money, super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final items = products.cartItems;
    final orders = Provider.of<Orders>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Umumiy summa:",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Text(
                "\$$money",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  if(items.isEmpty){
                    return;
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, OrdersScreen.routeName, (route) => false);
                  orders.addToOrderList(DateTime.now(), money, items);
                  products.deleteAllCartItem();
                },
                child: Text(
                  "Xarid qilish \$$money",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

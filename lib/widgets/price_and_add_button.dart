import 'package:flutter/material.dart';
import 'package:homework_8/provider/products.dart';
import 'package:provider/provider.dart';

class PriceAndAddButton extends StatelessWidget {
  final double price;
  final String id;
  const PriceAndAddButton({required this.price, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$ ${price.toStringAsFixed(2)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 150,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white38),
              onPressed: () {
                products.increaseCartItem(id);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Savatchaga mahsulot qo'shildi!"),
                    duration: const Duration(seconds: 2),
                    padding: const EdgeInsets.only(left: 10),
                    action: SnackBarAction(
                      onPressed: () {
                        products.decreaseCartItem(id, remove: true);
                      },
                      label: "BEKOR QILISH",
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}

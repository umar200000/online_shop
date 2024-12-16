import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:homework_8/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailsButton extends StatelessWidget {
  final ProductModel product;
  final int number;
  final bool checkProduct;
  final void Function() helper;
  const ProductDetailsButton(
      {required this.product,
      required this.number,
      required this.checkProduct,
      required this.helper,
      super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        "Umumiy narxi:",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        "\$${(product.price * number).toStringAsFixed(2)}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: product.color,
        ),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            backgroundColor: checkProduct ? Colors.grey.shade100 : Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          if (checkProduct) {
            Navigator.pushNamed(context, CartScreen.routeName).then((value) {
              helper();
            });
          } else {
            products.addToCart(product, number);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (checkProduct)
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            Text(
              checkProduct ? "Savatchaga borish" : "Savatchaga qo'shish",
              style: TextStyle(
                  color: checkProduct ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:homework_8/screens/add_or_edit_screen.dart';
import 'package:provider/provider.dart';

class ManageListView extends StatelessWidget {
  const ManageListView({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final products = Provider.of<Products>(context);
    return Card(
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  product.color.withOpacity(0.5),
                  product.color.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
              ),
            ),
            child: Image.network(product.imageUrlList[0])),
        title: Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddOrEditScreen.routeName,
                      arguments: product.id);
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey.shade500,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text("Ishonchingiz komilmi?"),
                          content: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: product.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const TextSpan(
                                  text: " Maxsuloti ro'yhatdan o'chmoqda!"),
                            ]),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "BEKOR QILISH",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                products.deleteProduct(product);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: const Text(
                                "O'CHIRISH",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey.shade500,
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class CartItemsPage extends StatelessWidget {
  final ProductModel item;
  const CartItemsPage({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Card(
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  item.color.withOpacity(0.5),
                  item.color.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 1],
              ),
            ),
            child: Image.network(item.imageUrlList[0])),
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${(item.price * item.quantity).toStringAsFixed(2)}",
              style: item.discount != null
                  ? const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2,
                    )
                  : const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
            ),
            if (item.discount != null) ...[
              Text(
                "${item.discount!.ceil()}% chegirma: \$${(item.price * item.quantity - ((item.price * item.discount!) / 100) * item.quantity).toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              )
            ]
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  products.decreaseCartItem(item.id);
                },
                icon: const Icon(Icons.remove)),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade100,
              ),
              child: Text(
                "${item.quantity}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  products.increaseCartItem(item.id);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}

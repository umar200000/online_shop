import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:provider/provider.dart';

import '../widgets/buy_item_widget.dart';
import '../widgets/cart_items_page.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = "/cart-screen";

  void dialog(BuildContext context, void Function() function, Widget? content,
      String title) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            title: const Text(
              "Ishonchingiz komilmi?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            content: content,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "BEKOR QILISH",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {
                  function();
                  Navigator.pop(context);
                },
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final money = products.getMoney();
    final items = products.cartItems;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              dialog(context, () {
                products.deleteAllCartItem();
              }, null, "Tozalash");
            },
            child: const Text(
              "Tozalash",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Colors.amber,
        title: const Text(
          "Savatcha",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Sizning buyurtmalaringiz",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.3,
                          motion: const ScrollMotion(),
                          children: [
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                dialog(context, () {
                                  products.deleteCartItem(items[index].id);
                                },
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: items[index].title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const TextSpan(
                                              text:
                                                  " Maxsuloti savatchadan o'chirilmoqda!"),
                                        ],
                                      ),
                                    ),
                                    "O'chirish");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                              ),
                              child: const Text(
                                "O'chirish",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        key: ValueKey<ProductModel>(items[index]),
                        child: CartItemsPage(
                          item: items[index],
                        ),
                      );
                    },
                    itemCount: items.length,
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "Afsuzkiy hozirda savatchada mahsulot mavjud emas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/128/13791/13791276.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
          const Divider(thickness: 0.5),
          BuyItemWidget(money: money),
        ],
      ),
    );
  }
}

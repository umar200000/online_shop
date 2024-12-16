import 'package:flutter/material.dart';
import 'package:homework_8/provider/orders.dart';
import 'package:homework_8/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/orders_list.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "order-screen";
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersList = Provider.of<Orders>(context).items;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Buyurtmalar"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        itemBuilder: (ctx, i) {
          return OrdersList(
            order: ordersList[i],
          );
        },
        itemCount: ordersList.length,
      ),
      drawer: const DrawerWidget(),
    );
  }
}

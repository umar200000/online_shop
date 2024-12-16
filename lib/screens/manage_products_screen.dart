import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:homework_8/screens/add_or_edit_screen.dart';
import 'package:homework_8/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/manage_listview.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({super.key});
  static const String routeName = "/manage-products-screen";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productsList = products.products;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddOrEditScreen.routeName);
              },
              icon: const Icon(Icons.add)),
        ],
        title: const Text(
          "Mahsulotlar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider<ProductModel>.value(
            value: productsList[i],
            child: const ManageListView(),
          );
        },
        itemCount: productsList.length,
      ),
      drawer: const DrawerWidget(),
    );
  }
}

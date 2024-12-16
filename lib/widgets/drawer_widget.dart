import 'package:flutter/material.dart';
import 'package:homework_8/screens/main_screen.dart';
import 'package:homework_8/screens/orders_screen.dart';

import '../screens/manage_products_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  Widget drawerItem(String title, IconData icon, Function() function) {
    return ListTile(
      onTap: function,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.black54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber,
            centerTitle: true,
            title: const Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          drawerItem("Bosh Sahifa", Icons.home, () {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          }),
          const Divider(),
          drawerItem("Buyurtmalar", Icons.done, () {
            Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
          }),
          const Divider(),
          drawerItem(
            "Mahsulotlarni boshqarish",
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(
                  context, ManageProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

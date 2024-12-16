import 'package:flutter/material.dart';

import 'package:homework_8/screens/tab_bar_main/tab_bar_screen.dart';

import '../widgets/cart_icon.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/text_main.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/main-screen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Rexar Shop",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          CartIcon(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMain(),
            SizedBox(height: 10),
            Expanded(
              child: TabBarScreen(),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:homework_8/database/app_database.dart';
import 'package:homework_8/provider/orders.dart';
import 'package:homework_8/provider/products.dart';
import 'package:homework_8/screens/add_or_edit_screen.dart';
import 'package:homework_8/screens/cart_screen.dart';
import 'package:homework_8/screens/main_screen.dart';
import 'package:homework_8/screens/manage_products_screen.dart';
import 'package:homework_8/screens/orders_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("database");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider<Orders>(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.routeName,
        routes: {
          MainScreen.routeName: (ctx) => const MainScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          ManageProductsScreen.routeName: (ctx) => const ManageProductsScreen(),
          AddOrEditScreen.routeName: (ctx) => const AddOrEditScreen(),
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/order_model.dart';
import '../models/product_model.dart';

class HiveRepo {
  final Box _box = Hive.box("database");

  void addToDatabaseProduct(List<ProductModel> products) {
    List<Map<String, dynamic>> items = products.map((item) {
      return item.toJson();
    }).toList();
    _box.put("product", jsonEncode(items));
  }

  List<ProductModel> getFromDatabaseProduct() {
    List<ProductModel> items = [];
    final String data = _box.get("product", defaultValue: "");
    if (data.isNotEmpty) {
      List<dynamic> cartItems = jsonDecode(data);
      items = cartItems.map((item) {
        return ProductModel.fromJson(item);
      }).toList();
    }
    return items;
  }

  void addToDatabaseCart(List<ProductModel> cartItems) {
    List<Map<String, dynamic>> items = cartItems.map((item) {
      return item.toJson();
    }).toList();
    _box.put("cart1", jsonEncode(items));
  }

  List<ProductModel> getFromDatabaseCart() {
    List<ProductModel> items = [];
    final String data = _box.get("cart1", defaultValue: "");
    if (data.isNotEmpty) {
      List<dynamic> cartItems = jsonDecode(data);
      items = cartItems.map((item) {
        return ProductModel.fromJson(item);
      }).toList();
    }
    return items;
  }

  void addToDatabaseOrder(List<OrderModel> orders) {
    List<Map<String, dynamic>> items = orders.map((order) {
      return order.toJson();
    }).toList();
    _box.put("order", jsonEncode(items));
  }

  List<OrderModel> getFromDatabaseOrder() {
    List<OrderModel> orders = [];
    final String checker = _box.get("order", defaultValue: "");
    if (checker.isNotEmpty) {
      List<dynamic> items = jsonDecode(checker);
      orders = items.map((order) {
        return OrderModel.fromJson(order);
      }).toList();
      // for (final item in items) {
      //   orders.add(OrderModel.fromJson(item));
      // }
    }
    return orders;
  }
}

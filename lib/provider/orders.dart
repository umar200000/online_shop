import 'package:flutter/cupertino.dart';
import 'package:homework_8/database/app_database.dart';

import '../models/order_model.dart';
import '../models/product_model.dart';

class Orders with ChangeNotifier {
  final List<OrderModel> _items = HiveRepo().getFromDatabaseOrder();

  List<OrderModel> get items => [..._items];

  void addToOrderList(
      DateTime dateTime, String allPrice, List<ProductModel> products) {
    _items.add(OrderModel(
      id: UniqueKey().toString(),
      dateTime: dateTime,
      allPrice: allPrice,
      orderList: products,
    ));
    HiveRepo().addToDatabaseOrder(_items);
    notifyListeners();
  }
}

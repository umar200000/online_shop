import 'package:homework_8/models/product_model.dart';

class OrderModel {
  final String id;
  final DateTime dateTime;
  final String allPrice;
  final List<ProductModel> orderList;
  OrderModel({
    required this.id,
    required this.dateTime,
    required this.allPrice,
    required this.orderList,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'allPrice': allPrice,
      'orderList': orderList.map((product) {
        return product.toJson();
      }).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> data) {
    List<dynamic> list = data['orderList'];
    return OrderModel(
      id: data['id'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
      allPrice: data['allPrice'],
      orderList: list.map((item) {
        return ProductModel.fromJson(item);
      }).toList(),
    );
  }
}

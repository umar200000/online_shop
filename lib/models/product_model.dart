import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final List<String> imageUrlList;
  final double? discount;
  bool newOld;
  final Color color;
  int quantity;
  bool like;

  ProductModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrlList,
    required this.like,
    required this.newOld,
    required this.discount,
    required this.color,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "price": price,
      "imageUrlList": imageUrlList,
      "like": like,
      "newOld": newOld,
      "discount": discount,
      "color": color.value,
      "quantity": quantity,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    List<dynamic> list = data['imageUrlList'];
    return ProductModel(
      id: data['id'],
      title: data['title'],
      subtitle: data['subtitle'],
      price: data['price'],
      imageUrlList: list.map((e) {
        return e.toString();
      }).toList(),
      like: data['like'],
      newOld: data['newOld'],
      discount: data['discount'],
      color: Color(data['color']),
      quantity: data["quantity"],
    );
  }

  isLike() {
    like = !like;
    notifyListeners();
  }

  isNewOrOld() {
    newOld = !newOld;
    notifyListeners();
  }

  addQuantity() {
    quantity++;
    notifyListeners();
  }
}

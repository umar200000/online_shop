import 'package:flutter/material.dart';
import 'package:homework_8/database/app_database.dart';

import '../models/product_model.dart';

class Products with ChangeNotifier {
  final List<ProductModel> _products =
      HiveRepo().getFromDatabaseProduct().isNotEmpty
          ? HiveRepo().getFromDatabaseProduct()
          : [
              ProductModel(
                id: UniqueKey().toString(),
                title: "Qizl kurtka",
                subtitle: "Yomg'irbop ajoyib kurtka",
                price: 11.50,
                imageUrlList: [
                  "https://cdn-icons-png.flaticon.com/128/1926/1926322.png",
                  "https://cdn-icons-png.flaticon.com/128/2784/2784455.png",
                  "https://cdn-icons-png.flaticon.com/128/7223/7223203.png",
                  "https://cdn-icons-png.flaticon.com/128/705/705676.png",
                ],
                like: false,
                newOld: true,
                discount: 25,
                color: Colors.red,
              ),
              ProductModel(
                id: UniqueKey().toString(),
                title: "Fudbo'lka",
                subtitle: "Yozgi ajoyib fudbo'lka",
                price: 3.25,
                imageUrlList: [
                  "https://cdn-icons-png.flaticon.com/128/892/892458.png",
                  "https://cdn-icons-png.flaticon.com/128/1867/1867565.png",
                  "https://cdn-icons-png.flaticon.com/128/3005/3005895.png",
                  "https://cdn-icons-png.flaticon.com/128/2912/2912546.png",
                ],
                like: false,
                newOld: true,
                discount: null,
                color: Colors.blue,
              ),
              ProductModel(
                id: UniqueKey().toString(),
                title: "O'yin puluti",
                subtitle: "PlayStation uchun maxsus",
                price: 5.5,
                imageUrlList: [
                  "https://cdn-icons-png.flaticon.com/128/2331/2331852.png",
                  "https://cdn-icons-png.flaticon.com/128/8037/8037145.png",
                  "https://cdn-icons-png.flaticon.com/128/2972/2972048.png",
                  "https://cdn-icons-png.flaticon.com/128/361/361984.png",
                ],
                like: false,
                newOld: false,
                discount: 10,
                color: const Color(0xffADB9C1),
              ),
              ProductModel(
                id: UniqueKey().toString(),
                title: "Oyoq kiyim",
                subtitle: "Ajoyib krasofka sizlar uchun maxsus",
                price: 12,
                imageUrlList: [
                  "https://cdn-icons-png.flaticon.com/128/2742/2742674.png",
                  "https://cdn-icons-png.flaticon.com/128/2742/2742687.png",
                  "https://cdn-icons-png.flaticon.com/128/3343/3343850.png",
                  "https://cdn-icons-png.flaticon.com/128/1785/1785340.png",
                ],
                like: false,
                newOld: false,
                discount: null,
                color: const Color(0xffD0881B),
              ),
            ];

  final List<ProductModel> _cartItems = HiveRepo().getFromDatabaseCart();

  List<ProductModel> get products => [..._products];
  List<ProductModel> get cartItems => [..._cartItems];

  void addToCart(ProductModel product, int quantity) {
    _cartItems.add(product);
    _cartItems.firstWhere((element) => element.id == product.id).quantity =
        quantity;
    HiveRepo().addToDatabaseCart(_cartItems);
    notifyListeners();
  }

  void deleteCartItem(String id) {
    _cartItems.removeWhere((element) => element.id == id);
    HiveRepo().addToDatabaseCart(_cartItems);
    notifyListeners();
  }

  void deleteAllCartItem() {
    _cartItems.clear();
    HiveRepo().addToDatabaseCart(_cartItems);
    notifyListeners();
  }

  void increaseCartItem(String id) {
    if (_cartItems.any((element) => element.id == id)) {
      _cartItems.firstWhere((element) => element.id == id).quantity++;
    } else {
      _cartItems.add(_products.firstWhere((element) => element.id == id));
    }
    HiveRepo().addToDatabaseCart(_cartItems);
    notifyListeners();
  }

  void decreaseCartItem(String id, {bool remove = false}) {
    if (_cartItems.firstWhere((element) => element.id == id).quantity != 1) {
      _cartItems.firstWhere((element) => element.id == id).quantity--;
      notifyListeners();
    } else if (remove) {
      deleteCartItem(id);
    }
    HiveRepo().addToDatabaseCart(_cartItems);
  }

  String getMoney() {
    double sum = 0;
    for (var element in _cartItems) {
      sum += (element.price -
              (element.discount != null
                  ? element.price * element.discount! / 100
                  : 0)) *
          element.quantity;
    }
    return sum.toStringAsFixed(2);
  }

  List<ProductModel> get likeProducts =>
      _products.where((element) => element.like).toList();

  void addNewProduct(ProductModel productModel) {
    _products.add(productModel);
    HiveRepo().addToDatabaseProduct(_products);
    notifyListeners();
  }

  void deleteProduct(ProductModel productModel) {
    _products.removeWhere((element) => element.id == productModel.id);
    HiveRepo().addToDatabaseProduct(_products);
    notifyListeners();
  }

  void updateProduct(ProductModel productModel) {
    int index =
        _products.indexWhere((element) => element.id == productModel.id);
    _products[index] = productModel;
    HiveRepo().addToDatabaseProduct(_products);

    notifyListeners();
  }
}
/*
[
    ProductModel(
      id: UniqueKey().toString(),
      title: "Qizl kurtka",
      subtitle: "Yomg'irbop ajoyib kurtka",
      price: 11.50,
      imageUrlList: [
        "https://cdn-icons-png.flaticon.com/128/1926/1926322.png",
        "https://cdn-icons-png.flaticon.com/128/2784/2784455.png",
        "https://cdn-icons-png.flaticon.com/128/7223/7223203.png",
        "https://cdn-icons-png.flaticon.com/128/705/705676.png",
      ],
      like: false,
      newOld: true,
      discount: 25,
      color: Colors.red,
    ),
    ProductModel(
      id: UniqueKey().toString(),
      title: "Fudbo'lka",
      subtitle: "Yozgi ajoyib fudbo'lka",
      price: 3.25,
      imageUrlList: [
        "https://cdn-icons-png.flaticon.com/128/892/892458.png",
        "https://cdn-icons-png.flaticon.com/128/1867/1867565.png",
        "https://cdn-icons-png.flaticon.com/128/3005/3005895.png",
        "https://cdn-icons-png.flaticon.com/128/2912/2912546.png",
      ],
      like: false,
      newOld: true,
      discount: null,
      color: Colors.blue,
    ),
    ProductModel(
      id: UniqueKey().toString(),
      title: "O'yin puluti",
      subtitle: "PlayStation uchun maxsus",
      price: 5.5,
      imageUrlList: [
        "https://cdn-icons-png.flaticon.com/128/2331/2331852.png",
        "https://cdn-icons-png.flaticon.com/128/8037/8037145.png",
        "https://cdn-icons-png.flaticon.com/128/2972/2972048.png",
        "https://cdn-icons-png.flaticon.com/128/361/361984.png",
      ],
      like: false,
      newOld: false,
      discount: 10,
      color: const Color(0xffADB9C1),
    ),
    ProductModel(
      id: UniqueKey().toString(),
      title: "Oyoq kiyim",
      subtitle: "Ajoyib krasofka sizlar uchun maxsus",
      price: 12,
      imageUrlList: [
        "https://cdn-icons-png.flaticon.com/128/2742/2742674.png",
        "https://cdn-icons-png.flaticon.com/128/2742/2742687.png",
        "https://cdn-icons-png.flaticon.com/128/3343/3343850.png",
        "https://cdn-icons-png.flaticon.com/128/1785/1785340.png",
      ],
      like: false,
      newOld: false,
      discount: null,
      color: const Color(0xffD0881B),
    ),
  ]
 */

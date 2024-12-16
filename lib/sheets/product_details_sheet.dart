import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';

import '../widgets/big_con_sheet.dart';
import '../widgets/go_back.dart';
import '../widgets/sheet_image.dart';

class ProductDetailsSheet extends StatelessWidget {
  final ProductModel product;
  final void Function() workOne;
  const ProductDetailsSheet(
      {required this.product, required this.workOne, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SheetImage(
          image: product.imageUrlList[0],
          color: product.color,
        ),
        BigConSheet(
          product: product,
          workOne: workOne,
        ),
        const GoBack(),
      ],
    );
  }
}

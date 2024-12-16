import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:homework_8/widgets/product_details_button.dart';
import 'package:provider/provider.dart';

import '../tools/get_size_widget.dart';
import 'images_row.dart';
import 'list_title_con.dart';

class BigConSheet extends StatefulWidget {
  final ProductModel product;
  final void Function() workOne;
  const BigConSheet({required this.product, required this.workOne, super.key});

  @override
  State<BigConSheet> createState() => _BigConSheetState();
}

class _BigConSheetState extends State<BigConSheet> {
  double top = 0;
  double bottom = 0;
  int number = 1;
  bool t = true;

  void helper() {
    setState(() {
      t = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    bool checkProduct =
        products.cartItems.any((element) => element.id == widget.product.id);

    if (checkProduct && t) {
      number = products.cartItems
          .firstWhere((element) => element.id == widget.product.id)
          .quantity;
      t = false;
    }
    if (t) {
      number = 1;
      t = false;
    }
    return Stack(
      children: [
        Positioned(
          top: 345,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                  onPressed: () {
                    if (number != 1) {
                      setState(() {
                        number--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Text(number.toString()),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 35,
                width: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 400,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: MediaQuery.of(context).size.height - 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MeasureSize(
                    onChange: (Size size) {
                      setState(() {
                        top = size.height;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTileCon(
                          product: widget.product,
                          workOne: widget.workOne,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.product.subtitle,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ImagesRow(images: widget.product.imageUrlList),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height - 410 - top - bottom,
                  ),
                  MeasureSize(
                    onChange: (Size size) {
                      setState(() {
                        bottom = size.height;
                      });
                    },
                    child: Column(
                      children: [
                        const Divider(thickness: 0.5),
                        ProductDetailsButton(
                          product: widget.product,
                          number: number,
                          checkProduct: checkProduct,
                          helper: helper,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:provider/provider.dart';

import '../../sheets/product_details_sheet.dart';
import '../../widgets/discount_and_newOld.dart';
import '../../widgets/main_image.dart';
import '../../widgets/price_and_add_button.dart';
import '../../widgets/titles.dart';

class AllPage extends StatelessWidget {
  final int index;
  final void Function() workOne;
  const AllPage({required this.index, required this.workOne, super.key});

  showProductDetailsSheet(BuildContext context, ProductModel product) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      builder: (ctx) {
        return ProductDetailsSheet(product: product, workOne: workOne);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final items = index == 0 ? products.products : products.likeProducts;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: items.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    showProductDetailsSheet(context, items[i]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            items[i].color.withOpacity(0.5),
                            items[i].color.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 1],
                        )),
                    // alignment: Alignment.center,
                    child: Stack(
                      children: [
                        MainImage(
                          image: items[i].imageUrlList[0],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DiscountAndNewOld(
                                discount: items[i].discount,
                                newOld: items[i].newOld,
                                color: items[i].color,
                              ),
                              const Spacer(),
                              Titles(
                                title: items[i].title,
                                subtitle: items[i].subtitle,
                                color: items[i].color,
                              ),
                              const SizedBox(height: 10),
                              PriceAndAddButton(
                                price: items[i].price,
                                id: items[i].id,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: items.length,
            )
          : Center(
              child: index != 0
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Maxsulot ustiga ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.favorite),
                        Text(
                          " bosing!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Mahsulotlar mavjud emas!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Image.network(
                            'https://cdn-icons-png.flaticon.com/128/7642/7642724.png'),
                        const SizedBox(height: 20),
                      ],
                    ),
            ),
    );
  }
}

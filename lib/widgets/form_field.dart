import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';

class FormFields extends StatelessWidget {
  final FocusNode disFocus;
  final FocusNode discountFocus;
  ProductModel product;
  final void Function(ProductModel item) function;
  FormFields(
      {required this.disFocus,
      required this.discountFocus,
      required this.product,
      required this.function,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: product.title,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(disFocus);
          },
          cursorColor: Colors.amber,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(),
            labelText: "Nomi",
            floatingLabelStyle: TextStyle(color: Colors.amber),
            labelStyle: TextStyle(color: Colors.grey),
          ),
          onSaved: (newValue) {
            product = ProductModel(
              id: product.id,
              title: newValue!,
              subtitle: product.subtitle,
              price: product.price,
              imageUrlList: product.imageUrlList,
              like: product.like,
              newOld: product.newOld,
              discount: product.discount,
              color: product.color,
            );
            function(product);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Mahsulot nomini kirgizin";
            } else if (value.length < 4) {
              return "Mahsulot nomining uzunligi kamida 4 ta harif";
            }
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
            initialValue: product.subtitle,
            focusNode: disFocus,
            maxLines: 4,
            cursorColor: Colors.amber,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: "Ta'rfi",
              floatingLabelStyle: TextStyle(color: Colors.amber),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            onSaved: (newValue) {
              product = ProductModel(
                id: product.id,
                title: product.title,
                subtitle: newValue!,
                price: product.price,
                imageUrlList: product.imageUrlList,
                like: product.like,
                newOld: product.newOld,
                discount: product.discount,
                color: product.color,
              );
              function(product);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Mahsulot ta'rfi kirgizin";
              } else if (value.length < 10) {
                return "Mahsulot ta'rfining uzunligi kamida 10 ta harif";
              }
            }),
        const SizedBox(height: 10),
        TextFormField(
            initialValue:
                product.price != 0 ? product.price.toStringAsFixed(2) : "",
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(discountFocus);
            },
            cursorColor: Colors.amber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: "Narxi",
              floatingLabelStyle: TextStyle(color: Colors.amber),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            onSaved: (newValue) {
              product = ProductModel(
                id: product.id,
                title: product.title,
                subtitle: product.subtitle,
                price: double.parse(newValue!),
                imageUrlList: product.imageUrlList,
                like: product.like,
                newOld: product.newOld,
                discount: product.discount,
                color: product.color,
              );
              function(product);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Mahsulot narhin kirgizin";
              } else if (double.tryParse(value) == null) {
                return "Mahsulot narhin to'g'ri kirgizin";
              } else if (double.parse(value!) < 1) {
                return "Mahsulot narhin 0 dan katta kirgizin";
              }
            }),
        const SizedBox(height: 10),
        TextFormField(
            initialValue: product.discount != null && product.discount != 0
                ? product.discount!.toString()
                : "",
            focusNode: discountFocus,
            cursorColor: Colors.amber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: "Chegirma%",
              floatingLabelStyle: TextStyle(color: Colors.amber),
              labelStyle: TextStyle(color: Colors.grey),
            ),
            onSaved: (newValue) {
              product = ProductModel(
                id: product.id,
                title: product.title,
                subtitle: product.subtitle,
                price: product.price,
                imageUrlList: product.imageUrlList,
                like: product.like,
                newOld: product.newOld,
                discount: double.tryParse(newValue!) != null
                    ? double.parse(newValue)
                    : 0,
                color: product.color,
              );
              function(product);
            },
            validator: (value) {
              try {
                if (value!.isNotEmpty) {
                  double.parse(value);
                }
              } catch (e) {
                return "Mahsulot chegrmasin to'g'ri kiriting";
              }

              if (value!.isNotEmpty && double.parse(value!) < 0) {
                return "Mahsulot chegrmasi manfiy bo'lmaydi";
              } else if (value == "0") {
                return "Mahsulot chegrmasi 0 bo'lmaydi";
              }
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}

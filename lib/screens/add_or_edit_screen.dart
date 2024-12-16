import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';
import 'package:homework_8/provider/products.dart';
import 'package:provider/provider.dart';
import '../widgets/color_picker.dart';
import '../widgets/form_field.dart';
import '../widgets/image_pickers.dart';

class AddOrEditScreen extends StatefulWidget {
  static const String routeName = "/add-or-edit-screen";
  const AddOrEditScreen({super.key});

  @override
  State<AddOrEditScreen> createState() => _AddOrEditScreenState();
}

class _AddOrEditScreenState extends State<AddOrEditScreen> {
  bool checkArgument = true;
  bool argument = false;
  final FocusNode _disFocus = FocusNode();
  bool check = false;
  final FocusNode _discountFocus = FocusNode();
  Color myColor = Colors.amber;
  Color helperColor = Colors.amber;
  final _form = GlobalKey<FormState>();
  ProductModel product = ProductModel(
    id: UniqueKey().toString(),
    title: '',
    subtitle: "",
    price: 0.0,
    imageUrlList: List.generate(4, (index) => ""),
    like: false,
    newOld: false,
    discount: null,
    color: Colors.transparent,
  );

  void function(ProductModel productModel) {
    product = productModel;
  }

  void saveProduct() {
    FocusScope.of(context).unfocus();
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      if (argument) {
        Provider.of<Products>(context, listen: false).updateProduct(product);
        Navigator.pop(context);
      } else if (!product.imageUrlList.contains("")) {
        Provider.of<Products>(context, listen: false).addNewProduct(product);
        Navigator.pop(context);
      }
    }
    if (!check) {
      setState(() {
        check = true;
      });
    }
  }

  @override
  void dispose() {
    _discountFocus.dispose();
    _disFocus.dispose();
    super.dispose();
  }

  void setColor(Color color) {
    setState(() {
      myColor = color;
      product = ProductModel(
        id: product.id,
        title: product.title,
        subtitle: product.subtitle,
        price: product.price,
        imageUrlList: product.imageUrlList,
        like: product.like,
        newOld: product.newOld,
        discount: product.discount,
        color: myColor,
      );
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (checkArgument) {
      checkArgument = false;
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final String id = ModalRoute.of(context)!.settings.arguments as String;
        argument = true;
        product = Provider.of<Products>(context, listen: false)
            .products
            .firstWhere((element) => element.id == id);
        myColor = product.color;
        helperColor = product.color;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Mahsulot Qo'shish",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: saveProduct,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormFields(
                    disFocus: _disFocus,
                    discountFocus: _discountFocus,
                    product: product,
                    function: function,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        const Text(
                          "Mahsulot yangimi:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Checkbox(
                            activeColor: Colors.amber,
                            side: const BorderSide(color: Colors.grey),
                            value: product.newOld,
                            onChanged: (_) {
                              setState(() {
                                product.isNewOrOld();
                              });
                            }),
                      ],
                    ),
                  ),
                  ColorPicker(
                    myColor: myColor,
                    helperColor: helperColor,
                    function: setColor,
                  ),
                  const SizedBox(height: 10),
                  ImagePickers(
                    images: product.imageUrlList,
                    check: check,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

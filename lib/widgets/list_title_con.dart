import 'package:flutter/material.dart';
import 'package:homework_8/models/product_model.dart';

class ListTileCon extends StatefulWidget {
  final ProductModel product;
  final void Function() workOne;
  const ListTileCon({required this.product, required this.workOne, super.key});

  @override
  State<ListTileCon> createState() => _ListTileConState();
}

class _ListTileConState extends State<ListTileCon> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.product.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.product.discount != null)
            Text(
              "${widget.product.discount!.ceil()}% CHEGIRMA",
              style: TextStyle(
                  height: 0,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: widget.product.color),
            ),
          if (widget.product.newOld)
            Text(
              "Yangi",
              style: TextStyle(
                  fontSize: 12,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: widget.product.color),
            ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.product.isLike();
            widget.workOne();
          });
        },
        icon:
            Icon(widget.product.like ? Icons.favorite : Icons.favorite_outline),
      ),
    );
  }
}

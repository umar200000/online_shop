import 'package:flutter/material.dart';

class SheetImage extends StatelessWidget {
  final String image;
  final Color color;
  const SheetImage({required this.image, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 80, right: 80, bottom: 80, top: 40),
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.5),
                color.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 1],
            ),
          ),
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

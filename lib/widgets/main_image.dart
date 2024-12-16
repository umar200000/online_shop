import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String image;
  const MainImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 0,
      right: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 230,
            height: 230,
            child: Image.network(
              image,
              fit: BoxFit.contain,
              //fit: BoxFit.,
            ),
          ),
        ],
      ),
    );
  }
}

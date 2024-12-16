import 'package:flutter/material.dart';

class TextMain extends StatelessWidget {
  const TextMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sevimli buyumingizni tanlang",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          "Ajoyiblik har bir buyumda mujassam",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

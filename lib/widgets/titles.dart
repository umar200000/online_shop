import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const Titles(
      {required this.title,
      required this.subtitle,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 19,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 45,
      right: 10,
      child: SizedBox(
        height: 40,
        width: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ),
    );
  }
}

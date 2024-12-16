import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPicker extends StatelessWidget {
  Color helperColor;
  final Color myColor;
  final void Function(Color color) function;
  ColorPicker(
      {required this.myColor,
      required this.helperColor,
      required this.function,
      super.key});

  void _openDialog(String title, Widget content, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(18.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                function(helperColor);
              },
              child: const Text('SUBMIT'),
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker(BuildContext context) async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: myColor,
        onColorChange: (color) {
          helperColor = color;
        },
      ),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Orqa fon rangini tanlag:",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            _openColorPicker(context);
          },
          child: Card(
            elevation: 0.5,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 20,
              height: 20,
              color: myColor,
            ),
          ),
        )
      ],
    );
  }
}

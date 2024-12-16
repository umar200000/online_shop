import 'package:flutter/material.dart';

class DiscountAndNewOld extends StatelessWidget {
  final double? discount;
  final bool newOld;
  final Color color;
  const DiscountAndNewOld(
      {required this.discount,
      required this.newOld,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    print(discount);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        discount != null && discount != 0
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${discount!.ceil()}% CHEGIRMA",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(),
        newOld
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Yangi",
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

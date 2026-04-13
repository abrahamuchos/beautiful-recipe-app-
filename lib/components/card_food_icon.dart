import 'package:flutter/material.dart';

class CardFoodIcon extends StatelessWidget {
  final String img;
  final String label;
  final Color bgColor;
  final Color labelColor;
  final Color? imgColor;

  const CardFoodIcon({
    super.key,
    required this.img,
    required this.label,
    required this.bgColor,
    required this.labelColor,
    this.imgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            Image.asset(
              img,
              width: 40,
              color: imgColor,
            ),
            SizedBox(height: 7,),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:beautiful_recipe_app/core/enums/food_difficulty.dart';
import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  final String image;
  final String title;
  final int minutes;
  final FoodDifficulty difficulty;
  final double? width;
  final double? height;

  const CardFood({
    super.key,
    required this.image,
    required this.title,
    required this.minutes,
    required this.difficulty,
    this.width = 200,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        //Card Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            image,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        //Card Text
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: AppColorsStyles.glassGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                //Card Text Title
                Text(
                  title,
                  style: TextStyle(
                    color: AppColorsStyles.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                //Card Text minutes
                Text(
                  '${minutes.toString()} min | ${difficulty.label}',
                  style: TextStyle(
                    color: AppColorsStyles.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

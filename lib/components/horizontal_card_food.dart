import 'package:beautiful_recipe_app/core/enums/food_difficulty.dart';
import 'package:beautiful_recipe_app/core/utils/text_format.dart';
import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';

class HorizontalCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final int minutes;
  final FoodDifficulty difficulty;


  const HorizontalCard({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.difficulty,
    required this.minutes
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            width: 165,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextFormat.truncate(title, 15),
              style: AppTextStyles.headlineTextStyle(16),
            ),
            Text(
              'By $author',
              style: TextStyle(
                color: AppColorsStyles.defaultGrey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: AppColorsStyles.green,
                  size: 18,
                ),
                SizedBox(
                  width: 7,
                ),
                Text('$minutes min'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.book,
                  color: AppColorsStyles.green,
                  size: 18,
                ),
                Text(FoodDifficulty.medium.label.toUpperCase()),
              ],
            ),
          ],
        )
      ],
    );
  }
}
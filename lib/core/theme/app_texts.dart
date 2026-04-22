import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle bodyTextMedium = TextStyle(
    color: AppColorsStyles.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle headlineTextStyle(double size, {Color color = AppColorsStyles.black}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'Fredoka',
      fontWeight: FontWeight.bold,
    );
  }
}

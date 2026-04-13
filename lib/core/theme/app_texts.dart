import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle bodyTextMedium = TextStyle(
    color: AppColorsStyles.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle headlineTextStyle(double size) {
    return TextStyle(
      color: AppColorsStyles.black,
      fontSize: size,
      fontFamily: 'Fredoka',
      fontWeight: FontWeight.bold,
    );
  }
}

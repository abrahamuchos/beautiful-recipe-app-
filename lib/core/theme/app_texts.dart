import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle headlineTextStyle (double size){
    return TextStyle(
      color: AppColorsStyles.black,
      fontSize: size,
      fontFamily: 'Fredoka',
      fontWeight: FontWeight.bold,
    );
  }
}
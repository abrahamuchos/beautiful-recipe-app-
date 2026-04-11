import 'package:flutter/material.dart';

enum FoodDifficulty{
  easy('Easy', Colors.lightGreenAccent),
  medium('Medium', Colors.orangeAccent),
  hard('Hard', Colors.redAccent);

  final String label;
  final Color color;

  const FoodDifficulty(this.label, this.color);
}
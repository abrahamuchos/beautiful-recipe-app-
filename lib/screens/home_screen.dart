import 'package:beautiful_recipe_app/components/card_food.dart';
import 'package:beautiful_recipe_app/core/enums/food_difficulty.dart';
import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            SizedBox(
              height: 10,
            ),
            buildSearchBar(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Today Recipe',
              style: AppTextStyles.headlineTextStyle(22),
            ),
            SizedBox(
              height: 10,
            ),
            CardFood(
              image: 'assets/images/pizza.jpg',
              title: 'Pizza Burger',
              minutes: 30,
              difficulty: FoodDifficulty.easy,
            ),
          ],
        ),
      ),
    );
  }

  TextField buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColorsStyles.lightBlue,
        hintText: "Search Recipe...",
        hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColorsStyles.lightGrey600),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: AppColorsStyles.black,
    );
  }

  /// Header info home
  Container buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.menu,
            size: 34,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'What would you\nlike to Cook?',
            style: AppTextStyles.headlineTextStyle(35),
          )
        ],
      ),
    );
  }
}

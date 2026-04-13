import 'package:beautiful_recipe_app/components/card_food_icon.dart';
import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';
import 'package:flutter/material.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: AppColorsStyles.white),
        child: Stack(
          children: [
            //Food Image
            buildImgFood(context),
            // Food Info Card
            buildInfoFood(context),
            //Icon arrow back
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 45, left: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColorsStyles.black,
                    size: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Build image about food
  Image buildImgFood(BuildContext context) {
    return Image.asset(
      'assets/images/burger.jpg',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Build info about food detail
  SingleChildScrollView buildInfoFood(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3,
        ),
        decoration: BoxDecoration(
          color: AppColorsStyles.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 35, right: 16, bottom: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Food Title
              Text(
                'Cheese Burger',
                style: AppTextStyles.headlineTextStyle(34),
              ),
              SizedBox(
                height: 10,
              ),
              //Food Info Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardFoodIcon(
                    img: 'assets/images/alarm.png',
                    label: '20 min',
                    bgColor: AppColorsStyles.lightGreen,
                    labelColor: AppColorsStyles.leenGreen,
                    imgColor: AppColorsStyles.leenGreen,
                  ),
                  CardFoodIcon(
                    img: 'assets/images/smiley.png',
                    label: 'Medium'.toUpperCase(),
                    bgColor: AppColorsStyles.lightYellow,
                    labelColor: AppColorsStyles.leenYellow,
                  ),
                  CardFoodIcon(
                    img: 'assets/images/fire.png',
                    label: '300 cal',
                    bgColor: AppColorsStyles.lightBlue,
                    labelColor: AppColorsStyles.leanBlue,
                    imgColor: AppColorsStyles.leanBlue,
                  ),
                ],
              ),
              //Food Ingredients
              SizedBox(
                height: 20,
              ),
              Text(
                "Ingredients",
                style: AppTextStyles.headlineTextStyle(28),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1) 4 Big White seed buns",
                style: AppTextStyles.bodyTextMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "2) Unsalted butter",
                style: AppTextStyles.bodyTextMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "3) American cheese",
                style: AppTextStyles.bodyTextMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "4) 1 Sweet onion",
                style: AppTextStyles.bodyTextMedium,
              ),

              //Food Directions
              SizedBox(
                height: 20,
              ),
              Text(
                "Directions",
                style: AppTextStyles.headlineTextStyle(28),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet nunc tincidunt, tincidunt urna eget, finibus neque. Nunc varius enim pharetra sapien luctus, a commodo turpis molestie. Ut enim metus, feugiat vitae lacinia nec, tincidunt sit amet nisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc sagittis viverra dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque luctus nisi quam, tincidunt scelerisque lacus eleifend et. Proin at nulla a est blandit accumsan sit amet in tortor. In pretium, ligula sit amet pellentesque mollis, justo augue aliquam neque, imperdiet ultrices augue odio et turpis. Fusce lorem nunc, ornare ac consequat et, varius a dui. Vestibulum id interdum neque.",
                style: AppTextStyles.bodyTextMedium,
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

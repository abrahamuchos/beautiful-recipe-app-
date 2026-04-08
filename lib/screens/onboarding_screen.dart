import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/core/theme/app_texts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsStyles.white,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/onboard.png'),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25k+ PREMIUM RECIPES',
                    style: TextStyle(
                      color: Color.fromARGB(120, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "It's\nCooking Time!",
                    style: AppTextStyles.headlineTextStyle(40.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 75,),
            Center(
              child: Container(
                width: 250,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(60)
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: AppColorsStyles.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

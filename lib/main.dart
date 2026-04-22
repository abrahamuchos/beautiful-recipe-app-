import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:beautiful_recipe_app/screens/add_recipe_screen.dart';
import 'package:beautiful_recipe_app/screens/food_detail_screen.dart';
import 'package:beautiful_recipe_app/screens/home_screen.dart';
import 'package:beautiful_recipe_app/screens/onboarding_screen.dart';
import 'package:beautiful_recipe_app/screens/signup_screen.dart';

Future<void> main() async {
  //Firebase Initial Config
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beautiful Recipe',
      // home: OnboardingScreen(),
      // home: AddRecipeScreen(),
      home: SignupScreen(),
    );
  }
}



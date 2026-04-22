import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();
  TextEditingController directionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Recipe',
          style: AppTextStyles.headlineTextStyle(22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Recipe
              Text(
                'Recipe Name',
                style: AppTextStyles.headlineTextStyle(18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Recipe Name',
                  filled: true,
                  fillColor: AppColorsStyles.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Time Taken
              Text(
                'Time Taken',
                style: AppTextStyles.headlineTextStyle(18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(
                  suffixText: 'minutes',
                  suffixStyle: TextStyle(color: AppColorsStyles.defaultGrey),
                  hintText: 'Enter Time ',
                  filled: true,
                  fillColor: AppColorsStyles.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Ingredients
              Text(
                'Ingredients',
                style: AppTextStyles.headlineTextStyle(18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ingredientController,
                maxLength: 100,
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: 'Max.100',
                  hintText: 'Enter Ingredients ',
                  filled: true,
                  fillColor: AppColorsStyles.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //Directions
              Text(
                'Directions',
                style: AppTextStyles.headlineTextStyle(18),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: directionsController,
                maxLength: 100,
                maxLines: 5,
                decoration: InputDecoration(
                  counterText: 'Max.100',
                  hintText: 'Enter Ingredients ',
                  filled: true,
                  fillColor: AppColorsStyles.lightBlue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //CTA
              GestureDetector(
                onTap: (){
                  print('SUCESS');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorsStyles.leenGreen,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Add Recipe',
                        style: AppTextStyles.headlineTextStyle(
                          18,
                          color: AppColorsStyles.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

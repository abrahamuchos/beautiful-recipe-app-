import 'package:beautiful_recipe_app/components/card_food.dart';
import 'package:beautiful_recipe_app/components/horizontal_card_food.dart';
import 'package:beautiful_recipe_app/core/enums/food_difficulty.dart';
import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';
import 'package:beautiful_recipe_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? recipeStream;

  getOnTheLoad() async {
    recipeStream = await DatabaseMethods().getAllRecipe();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getOnTheLoad();
  }

  Widget allRecipe() {
    return StreamBuilder(
        stream: recipeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Row(
                      children: [
                        CardFood(
                          image: 'assets/images/pizza.jpg',
                          title: ds["Recipe"],
                          minutes: ds['Time'],
                          difficulty: FoodDifficulty.easy,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                      ],
                    );
                  },
                )
              : Column(
                  children: [
                    Text('Not Data'),
                  ],
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  buildHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  // Search bar
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
                ],
              ),
            ),
            //Carousel Foods
            // buildCarouselFood(),
            SizedBox(
              width: double.infinity,
              height: 260,
              child: allRecipe(),
            ),
            SizedBox(
              height: 10,
            ),
            //Recommended Foods
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: buildRecommended(),
            ),
          ],
        ),
      ),
    );
  }

  Column buildRecommended() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended',
          style: AppTextStyles.headlineTextStyle(22),
        ),
        SizedBox(
          height: 5,
        ),
        // Horizontal Card
        HorizontalCard(
          image: 'assets/images/muffin.jpg',
          title: 'Muffin',
          author: 'Abraham',
          difficulty: FoodDifficulty.medium,
          minutes: 30,
        ),
        SizedBox(
          height: 10,
        ),
        HorizontalCard(
          image: 'assets/images/sandwich.jpg',
          title: 'Sandwich',
          author: 'Jesus',
          difficulty: FoodDifficulty.easy,
          minutes: 30,
        ),
        SizedBox(
          height: 10,
        ),
        HorizontalCard(
          image: 'assets/images/muffin.jpg',
          title: 'Muffin',
          author: 'Abraham',
          difficulty: FoodDifficulty.medium,
          minutes: 30,
        ),
        SizedBox(
          height: 10,
        ),
        HorizontalCard(
          image: 'assets/images/muffin.jpg',
          title:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu lacus aliquet, gravida felis eget, ultricies sem. Aliquam viverra eleifend dui, sit amet ultricies magna tempus eget.',
          author: 'Abraham',
          difficulty: FoodDifficulty.medium,
          minutes: 30,
        ),
      ],
    );
  }

  SizedBox buildCarouselFood() {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          SizedBox(
            width: 14,
          ),
          CardFood(
            image: 'assets/images/burger.jpg',
            title: 'Cheese Burger',
            minutes: 12,
            difficulty: FoodDifficulty.medium,
          ),
          SizedBox(
            width: 14,
          ),
          CardFood(
            image: 'assets/images/pizza.jpg',
            title: 'Pizza Margarita',
            minutes: 25,
            difficulty: FoodDifficulty.easy,
          ),
          SizedBox(
            width: 14,
          ),
          CardFood(
            image: 'assets/images/pasta.jpg',
            title: 'Pasta Carbon',
            minutes: 30,
            difficulty: FoodDifficulty.hard,
          ),
        ],
      ),
    );
  }

  TextField buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColorsStyles.marineBlue,
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

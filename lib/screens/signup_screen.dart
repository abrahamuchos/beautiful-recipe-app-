import 'package:beautiful_recipe_app/core/theme/app_colors.dart';
import 'package:beautiful_recipe_app/core/theme/app_texts.dart';
import 'package:beautiful_recipe_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String name = '', password = '', email = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  registration() async {
    if (nameController.text != '' &&
        passwordController != '' &&
        emailController != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String userId = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": emailController.text,
          "Id": userId
        };

        await DatabaseMethods().addUserInfo(userInfoMap, userId);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text(
            'Success',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Upps error',
            style: TextStyle(fontSize: 18),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColorsStyles.marineBlueDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              //Header
              Text(
                'Create\nAccount!',
                style: AppTextStyles.headlineTextStyle(
                  30,
                  color: AppColorsStyles.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Form
              buildForm(),
              SizedBox(
                height: 55,
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Next CTA and Login
                    buildActions(),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Already hace an account? Login',
                      style: TextStyle(
                        color: AppColorsStyles.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Next',
          style: TextStyle(
            fontSize: 22,
            color: AppColorsStyles.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (nameController.text != '' &&
                emailController.text != '' &&
                passwordController.text != '') {
              setState(() {
                name = nameController.text;
                email = emailController.text;
                password = passwordController.text;
              });
              registration();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColorsStyles.darkPurple,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_forward,
                    color: AppColorsStyles.white,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  /// Form about user info to registration
  Column buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Name
        Text(
          'Name',
          style: TextStyle(
            fontSize: 18,
            color: AppColorsStyles.white,
          ),
        ),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Enter Name',
            filled: true,
            fillColor: AppColorsStyles.white,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        //Email
        SizedBox(
          height: 15,
        ),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 18,
            color: AppColorsStyles.white,
          ),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter Email',
            filled: true,
            fillColor: AppColorsStyles.white,
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        //Password
        Text(
          'Password',
          style: TextStyle(
            fontSize: 18,
            color: AppColorsStyles.white,
          ),
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: 'Enter Password',
            filled: true,
            fillColor: AppColorsStyles.white,
            prefixIcon: Icon(Icons.password),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

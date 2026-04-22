import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  /// Add new user
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async{
    await FirebaseFirestore.instance.collection('users').doc(id).set(userInfoMap);
  }

  /// Add new Recipe Food
  Future addRecipe(Map<String, dynamic> recipe) async{
    await FirebaseFirestore.instance.collection('recipes').add(recipe);
  }

}
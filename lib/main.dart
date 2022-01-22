import 'package:drive/pages/product_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: email == null ? LoginScreen() : productPage(),
  ));
}

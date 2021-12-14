import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'package:provider/provider.dart';
import 'providers/cart_functions.dart';
import 'pages/home_page.dart';
import 'pages/user_profile.dart';

void main() {
  // runApp(MaterialApp(
  //   home: HomePage(),
  // ));
  runApp(
   MyApp()
  // MaterialApp(home: Text("NEW"))
  );
}

class MyApp extends StatelessWidget{
  build(BuildContext context){
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(home: Scaffold(body: productPage())),
      );
  }
}

import 'package:drive/pages/request.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login.dart';
import 'package:drive/provider/cart_functions.dart';
import 'package:drive/pages/product_page.dart';
import 'package:provider/provider.dart';
import 'package:drive/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
  ));
  runApp(MyApp()
      // MaterialApp(home: Text("NEW"))
      );
}

class MyApp extends StatelessWidget {
  final _drive = Firebase.initializeApp();
  build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(home: Scaffold(body: MyLogin())),
    );
  }
}

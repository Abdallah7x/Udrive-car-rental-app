import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login.dart';
import 'package:drive/provider/cart_functions.dart';
import 'package:drive/pages/product_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(home: Scaffold(body: MyLogin())),
    );
  }
}

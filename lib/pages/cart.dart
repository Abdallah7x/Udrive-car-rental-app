// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drive/providers/cart_functions.dart';
import 'package:provider/provider.dart';
import 'package:drive/model/data.dart';
import 'home_page.dart';



class CheckoutPage extends StatefulWidget {
  @override
 
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, CartProvider, child) {
        return Scaffold(
         
            appBar: AppBar(
              title: Text('Checkout Page [\$ ${CartProvider.totalPrice}]'),
            ),
            body: CartProvider.basketItems.length == 0
                ? Text('no items in your cart')
                : ListView.builder(
                    itemCount: CartProvider.basketItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("hi"),
                            // CartProvider.basketItems[index].name),
                          subtitle: Text("hi"),
                              // Text(CartProvider.basketItems[index].pPromotionPrice.toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              CartProvider.remove(CartProvider.basketItems[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}

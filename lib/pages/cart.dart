import 'dart:html';

import 'package:flutter/material.dart';
import 'package:drive/model/data.dart';


class cart extends StatefulWidget{
  @override
  _CartViewState createState()=>_CartViewState();
}

class _CartViewState extends State<cart>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.transparent,
        leading:IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color:Colors.blue,
          ),
          onPressed: (){},
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
        children:<Widget>[
          Text("your cart",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
          ),
          SizedBox(height: 12.0),
          Container(
            width:80.0,
            height: 80.0,
            decoration: BoxDecoration(
            color:Colors.red[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          ),
        ],
      ),
      ),
    );
  }
  
}

import 'package:drive/pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:drive/model/data.dart';
import 'package:drive/theme/colors.dart';
import 'product_detail_page.dart';
import 'cart.dart';
import 'package:provider/provider.dart';
import '../providers/cart_functions.dart';

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
   // return Consumer<CartProvider>(
      //builder:(context,cart,child){
        return  Scaffold(
          appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyLogin()),
              );
            },
            child: Text("Log out"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text(
          'Our fleet',
        ),
      ),
          body: getBody(),
         );
      //}
   // );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Rental cars",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: primary,
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon:Icon(Icons.account_circle),
                     onPressed: () { 
                       
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => userprofile()));
                    
                      },
                      

                  ),
                  
                   
                  IconButton(
                  icon:Icon(Icons.shopping_cart),
                     onPressed: () { 
                       
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage()));
                    
                      },
                   ),
                   Text('3'),
                  SizedBox(
                    width: 10,
                  ),

                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    menus.length,
                    (index) => InkWell(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: activeIndex == index
                                      ? primary
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: activeIndex == index
                                          ? Colors.transparent
                                          : primary),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  menus[index],
                                  style: TextStyle(
                                      color: activeIndex == index
                                          ? white
                                          : primary,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ))),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: List.generate(
                items.length,
                (index) => InkWell(
                      onTap: () {
                        print(items[index]['id']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                  // item: items[index],
                      
                                      id: items[index]['id'],
                                      name: items[index]['name'],
                                      img: items[index]['img'],
                                      description: items[index]['description'],
                                      pPrice:
                                          items[index]['p_price'].toString(),
                                      pPromotionPrice: items[index]
                                              ['p_promotion_price']
                                          .toString(),
                                    )));
                      },
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: items[index]['id'].toString(),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(items[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index]['name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      items[index]['p_promotion_price']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      items[index]['p_price'].toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: warning,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}


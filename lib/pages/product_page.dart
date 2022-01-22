import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product_detail_page.dart';
import 'package:drive/pages/userprofile.dart';
import 'package:drive/pages/login1.dart';
import 'package:drive/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class productPage extends StatefulWidget {
  @override
  _productPage createState() => _productPage();
}

class _productPage extends State<productPage> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => r()));
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.shopping_cart),
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => CheckoutPage()));
                  //   },
                  // ),
                  Text('3'),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              logout(context);
            },
            child: Text("Log out"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Hey ${loggedInUser.firstName}!",
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Image(
                  image: NetworkImage(
                      'https://www.pricelesscarrental.com/smsite/npauto_5/media/imgs/6125_loader.gif')),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Column(
                  children: List.generate(
                      1,
                      (index) => InkWell(
                          onTap: () {
                            print(document['id']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductDetailPage(
                                          // item: items[index],

                                          id: document['id'],
                                          name: document['name'],
                                          img: document['img'],
                                          description: document['description'],
                                          pPrice:
                                              document['p_price'].toString(),
                                          pPromotionPrice:
                                              document['p_promotion_price']
                                                  .toString(),
                                        )));
                          },
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Hero(
                                  tag: document['id'].toString(),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(document['img']),
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
                                      document['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      document['description'],
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
                                          document['p_promotion_price']
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          document['p_price'].toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
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
                          ))));
            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}


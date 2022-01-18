import 'package:drive/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_detail_page.dart';
import 'package:drive/pages/user_profile.dart';
import 'cart.dart';

class productPage extends StatefulWidget {
  @override
  _productPage createState() => _productPage();
}

class _productPage extends State<productPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Our fleet"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
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
}

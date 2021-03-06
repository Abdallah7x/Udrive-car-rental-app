import 'package:drive/pages/password.dart';
import 'package:flutter/material.dart';
import 'package:drive/theme/colors.dart';
import 'package:drive/model/data.dart';
import 'cart.dart';
import 'user_profile.dart';
import 'package:provider/provider.dart';
import '../providers/cart_functions.dart';
import 'item.dart';


class ProductDetailPage extends StatefulWidget {
  
  final int id;
  final String name;
  final String img;
  final String description;
  final String pPrice;
  final String pPromotionPrice;

  final Item item;

  ProductDetailPage(
      {
        this.item,
        this.id,
      this.name,
      this.img,
      this.description,
      this.pPrice,
      this.pPromotionPrice}){
        print(id);
      }
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int qty = 1;
  int activeIndex = 0;

  // Item get item => null;
  @override
  Widget build(BuildContext context) {
     return Consumer<CartProvider>(
      builder:(context,CartProvider data,child){
    Item items;
    return Scaffold(
      
      body: getBody(items),
    );
       }
    ); 
  }

  Widget getBody(Item items) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios)),
            ),
          ),
          Hero(
            tag: widget.id.toString(),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.img), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Name :",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "description :",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Price :",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      widget.pPromotionPrice + " USD",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.pPrice + " USD",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: warning,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: <Widget>[
                Text(
                  "Number of days:",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onDoubleTap: () {
                        if (qty > 1) {
                          setState(() {
                            qty = --qty;
                          });
                        }
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      qty.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onDoubleTap: () {
                        setState(() {
                          qty = ++qty;
                        });
                        // minus here
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            child: Text(
                'Rent it',
              ),
            onDoubleTap: () {
              
               Provider.of<CartProvider>(context, listen: false).add(items);
              // context.read<CartProvider>().add(items[index].name);
              Navigator.push(

                context,
                MaterialPageRoute(builder: (context) => CheckoutPage()),
              );
        //          child: Center(
        //         child: 
        //             ListView.builder(
                      
        //     shrinkWrap: true,          
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
              
        //       // title: Text(items[index].name),
        //       // subtitle: Text(items[index].pPromotionPrice.toString()),
        //       // trailing: Icon(Icons.add),
        //       onTap: () {
        //          setState(() {
        //                       activeIndex = index;
        //                        id: items[index]['id'];
        //                        name: items[index]['name'];
        //                       // context.read<CartProvider>().add(items[index].name);
        //                       print(items[index]
        //                       );
        //                       Provider.of<CartProvider>(context, listen: false).add(items[index]);
        //                     });
                
        //         // cart_functions.add(items[index]);
        //       },
        //     );
        //   },
        // )
            
          
        //   );
            },
         
            ),
        ],
      ),
    );
  }
}

// class ProductDetialedPages extends StatelessWidget{
//   Widget build(BuildContext context){
//      return Scaffold(
      
//       body: getBody(item, context ),
//     );
//        }
//     ); 
//   }

//   Widget getBody(Item item, BuildContext context) {
//     return SafeArea(
//       child: ListView(
//         children: <Widget>[
//           InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Icon(Icons.arrow_back_ios)),
//             ),
//           ),
//           Hero(
//             tag: widget.id.toString(),
//             child: Container(
//               width: 400,
//               height: 400,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(widget.img), fit: BoxFit.cover)),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   "Name :",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 // Text(
//                 //   widget.name,
//                 //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 // )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   "description :",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   widget.description,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   "Price :",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     // Text(
//                     //   // widget.pPromotionPrice + " USD",
//                     //   style:
//                     //       TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                     // ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     // Text(
//                     //   // widget.pPrice + " USD",
//                     //   style: TextStyle(
//                     //       fontSize: 18,
//                     //       fontWeight: FontWeight.w500,
//                     //       color: warning,
//                     //       decoration: TextDecoration.lineThrough),
//                     // )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20, left: 20),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   "Number of days:",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     InkWell(
//                       // onDoubleTap: () {
//                       //   if (qty > 1) {
//                       //     setState(() {
//                       //       qty = --qty;
//                       //     });
//                       //   }
//                       // },
//                       child: Container(
//                         width: 25,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: primary),
//                             shape: BoxShape.circle),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       // qty.toString(),
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     InkWell(
//                       // onDoubleTap: () {
//                       //   setState(() {
//                       //     qty = ++qty;
//                       //   });
//                       //   // minus here
//                       // },
//                       child: Container(
//                         width: 25,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: primary),
//                             shape: BoxShape.circle),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           InkWell(
//             child: Text(
//                 'Rent it',
//               ),
//             onDoubleTap: () {
//               Provider.of<CartProvider>(context, listen: false).add(item);
//               Navigator.push(

//                 context,
//                 MaterialPageRoute(builder: (context) => CheckoutPage()),
//               );
//                  child: Center(
//                 child: 
//                     ListView.builder(
                      
//             shrinkWrap: true,          
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
              
//               // title: Text(items[index].name),
//               // subtitle: Text(items[index].pPromotionPrice.toString()),
//               // trailing: Icon(Icons.add),
//               onTap: () {
//                                id: items[index]['id'];
//                                name: items[index]['name'];
//                               // context.read<CartProvider>().add(items[index].name);
//                               print(items[index]
//                               );
//                               Provider.of<CartProvider>(context, listen: false).add(items[index]);
//                             });
                
//                 // cart_functions.add(items[index]);
//                       );
//           },
//         )
            
          
//           );
//             },
         
//             ),
//         ],
//       ),
//     );
//   }
//   }
// }

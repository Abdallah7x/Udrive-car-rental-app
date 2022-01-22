import 'package:drive/model/ads.dart';
import 'package:drive/pages/admin_cars.dart';
import 'package:drive/pages/admin_dashboard.dart';
import 'package:drive/pages/admin_users.dart';
import 'package:drive/provider/ads_provider.dart';
import 'package:drive/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class addAds extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdsProviders(),
      child: MaterialApp(
          title: 'Ads',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Admin_Ads()),
    );
  }
}

class Admin_Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.cyan.shade200,
        title: Text('ADs'),
        actions: <Widget>[
          // new IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
          // new IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('assets/man.png'),
                      radius: 50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Reynolds',
                      style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .3),
                    child: Text(
                      'Admin Profile',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Admin',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
            ),
            ListTile(
              title: const Text('Users'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addProfile()),
                );
              },
            ),
            /*  ListTile(
                title: const Text('Categories'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),*/
            ListTile(
              title: const Text('ADs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addAds()),
                );
              },
            ),
            ListTile(
              title: const Text('Cars'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addCar()),
                );
              },
            ),
            ListTile(
              title: const Text('Profile settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<AdsProviders>(
          builder: (context, AdsProviders data, child) {
            return data.getAds.length != 0
                ? ListView.builder(
                    itemCount: data.getAds.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getAds[index], index);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                        child: Text(
                      "Add new ads",
                      style: TextStyle(
                        color: white,
                      ),
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final Ads ads;
  int index;

  CardList(this.ads, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.25,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: ListTile(
              leading: Icon(Icons.supervisor_account),
              title: Text(ads.car_name),
              subtitle: Text(ads.car_number),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
              ),
            ),
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                label: 'Delete',
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) {
                  Provider.of<AdsProviders>(context, listen: false)
                      .removeAds(index);
                },
              ),
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _title = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _car_name = TextEditingController();
  TextEditingController _car_number = TextEditingController();
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("Add Ads"),
    onPressed: () {
      Provider.of<AdsProviders>(context, listen: false)
          .addAds(_car_name.text, _car_number.text, _title.text, _price.text);
      // Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Add new ads"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _title,
          decoration: InputDecoration(hintText: "Enter title"),
        ),
        TextField(
          controller: _price,
          decoration: InputDecoration(hintText: "Enter price"),
        ),
        TextField(
          controller: _car_name,
          decoration: InputDecoration(hintText: "Enter car_name"),
        ),
        TextField(
          controller: _car_number,
          decoration: InputDecoration(hintText: "Enter car_number"),
        ),
        SizedBox(height: 30),
        FlatButton(
          child: Text(
            'Upload image',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {},
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

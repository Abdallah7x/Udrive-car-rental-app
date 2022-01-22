import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive/model/cars.dart';
import 'package:drive/model/cars.dart';
import 'package:drive/pages/admin_ads.dart';
import 'package:drive/pages/admin_dashboard.dart';
import 'package:drive/pages/admin_users.dart';
import 'package:drive/provider/cars_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:drive/theme/colors.dart';

class addCar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CarProviders(),
      child: MaterialApp(
          title: 'Car',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Admin_Car()),
    );
  }
}

class Admin_Car extends StatefulWidget {
  @override
  State<Admin_Car> createState() => _Admin_CarState();
}

class _Admin_CarState extends State<Admin_Car> {
  @override
  Widget build(BuildContext context) {
    CarProviders carProvider = Provider.of<CarProviders>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      carProvider.getCarsCollectionFromFirebase().then((value) {});
    });
    List<Car> cars = carProvider.getCar;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.cyan.shade200,
        title: Text('Cars'),
        actions: <Widget>[],
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
            // ListTile(
            //   title: const Text('ADs'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => addAds()),
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Cars'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addCar()),
                );
              },
            ),
            // ListTile(
            //   title: const Text('Profile settings'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CarProviders>(
          builder: (context, CarProviders data, child) {
            return data.getCar.length != 0
                ? ListView.builder(
                    itemCount: data.getCar.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            showAlertDialog(context,
                                index: index, car: data.getCar[index]);
                          },
                          child: CardList(data.getCar[index], index));
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                        child: Text(
                      "Add new Car",
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
  final Car car;
  int index;

  CardList(this.car, this.index);

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
              title: Text(car.name),
              subtitle: Text(car.number),
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
                  Provider.of<CarProviders>(context, listen: false)
                      .removeCar(index);
                },
              ),
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context, {int index = null, Car car = null}) {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _rate = TextEditingController();

  _name.text = (car?.name) ?? "";
  _number.text = (car?.number) ?? "";
  _type.text = (car?.type) ?? "";
  _rate.text = (car?.rate) ?? "";
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("Confirm"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();

      if (car != null) {
        Provider.of<CarProviders>(context, listen: false).editCar(
            index, car.id, _name.text, _number.text, _type.text, _rate.text);
      } else {
        Provider.of<CarProviders>(context, listen: false)
            .addCar(_name.text, _number.text, _type.text, _rate.text);
      }
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Add new car "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(hintText: "Enter name"),
        ),
        TextField(
          controller: _number,
          decoration: InputDecoration(hintText: "Enter number"),
        ),
        TextField(
          controller: _type,
          decoration: InputDecoration(hintText: "Enter type"),
        ),
        TextField(
          controller: _type,
          decoration: InputDecoration(hintText: "Enter rate"),
        ),
        SizedBox(height: 10),
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

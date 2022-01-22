import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive/pages/admin_ads.dart';
import 'package:drive/pages/admin_cars.dart';
import 'package:drive/pages/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:drive/model/users.dart';
import 'package:drive/provider/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:drive/theme/colors.dart';

class addProfile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProviders(),
      child: MaterialApp(
          title: 'Users',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Admin_User()),
    );
  }
}

class Admin_User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersProviders userProvider =
        Provider.of<UsersProviders>(context, listen: true);
    Future.delayed(Duration(seconds: 0), () async {
      userProvider.getusersCollectionFromFirebase().then((value) {});
    });
    List<Users> users = userProvider.getUsers;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.cyan.shade200,
        title: Text('Users'),
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

            ListTile(
              title: const Text('Cars'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addCar()),
                );
              },
            ),
          ],
        ),
      ), //toolbarHeight: 100,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UsersProviders>(
          builder: (context, UsersProviders data, child) {
            return data.getUsers.length != 0
                ? ListView.builder(
                    itemCount: data.getUsers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            showAlertDialog(context,
                                index: index, user: data.getUsers[index]);
                          },
                          child: CardList(data.getUsers[index], index));
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                        child: Text(
                      "Add New Users",
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
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final Users users;
  int index;

  CardList(this.users, this.index);

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
              title: Text(users.firstname),
              subtitle: Text(users.email),
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
                onPressed: (context) async {
                  List<Users> _users = <Users>[];
                  Provider.of<UsersProviders>(context, listen: false)
                      .removeUsers(index);
                },
              ),
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context, {int index = null, Users user = null}) {
  TextEditingController _firstname = TextEditingController();
//  TextEditingController _id = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _secondname = TextEditingController();
  // Create button

  _firstname.text = (user?.firstname) ?? "";
  _email.text = (user?.email) ?? "";
  _secondname.text = (user?.secondname) ?? "";

  // Create button
  Widget okButton = ElevatedButton(
    child: Text("Confirm"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();

      if (user != null) {
        Provider.of<UsersProviders>(context, listen: false).editUsers(
            index, user.id, _firstname.text, _email.text, _secondname.text);
      } else {
        Provider.of<UsersProviders>(context, listen: false)
            .addUsers(_firstname.text, _email.text, _secondname.text);
      }
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW Users "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _firstname,
          decoration: InputDecoration(hintText: "Enter FIRSTNAME"),
        ),
        TextField(
          controller: _secondname,
          decoration: InputDecoration(hintText: "Enter The SECONDNAME"),
        ),
        TextField(
          controller: _email,
          decoration: InputDecoration(hintText: "Enter EMAIL"),
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

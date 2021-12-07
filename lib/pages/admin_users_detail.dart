import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/data.dart';

class AdminUsers extends StatefulWidget {
  final int id;
  final String name;

  final String Email;
  AdminUsers(
    {required this.id,
   required this.name,
    required this.Email});
  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

Widget getBody() {return SafeArea(
      child: ListView(
        children: <Widget>[
          InkWell(
            onDoubleTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios)),
            ),
          ),}
}

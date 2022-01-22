//import 'package:flutter_note_app_provider/models/data.dart';
import 'package:drive/pages/password.dart';
import 'package:flutter/material.dart';

class Users {
  String firstname;
  String id;
  String email;
  String secondname;

  Users({this.firstname,this.secondname, this.id, this.email});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      firstname: json['data']['firstName'],
      email: json['data']['email'],
      secondname: json['data']['secondName'],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:drive/model/users.dart';
import 'package:drive/model/data.dart';

class UsersProviders extends ChangeNotifier {
  //Notes List
  List<Users> _users = <Users>[];

  List<Users> get getNotes {
    return _users;
  }

// function to add data to list of notes
  void addUsers(String name, String id, String email, String img) {
    Users user = new Users(name, id, email, img);

    _users.add(user);

    notifyListeners();
  }

  // function to remove or delete notes by using list index position
  void removeUsers(int index) {
    _users.removeAt(index);
    notifyListeners();
  }
}

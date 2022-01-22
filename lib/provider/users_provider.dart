import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive/pages/password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drive/model/users.dart';
import 'package:drive/model/data.dart';

class UsersProviders extends ChangeNotifier {
  //Notes List
  bool _isLoaded = false;
  List<Users> _users = <Users>[];

  List<Users> get getUsers {
    return _users;
  }

  Future<void> getusersCollectionFromFirebase() async {
    if (_users.isNotEmpty) return;
    FirebaseFirestore _instance = FirebaseFirestore.instance;
    CollectionReference users = _instance.collection("users");
    QuerySnapshot querySnapshot = await users.get();
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    for (var element in allData) {
      notifyListeners();
      Users user = Users.fromJson(element);
      _users.add(user);
      _isLoaded = true;
    }
  }

// function to add data to list of notes
  void addUsers(String firstname,  String email, String secondname) {
    var added_user = FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'firstName': firstname,
      'secondName': secondname,
    }).then((value) {
      Users user = new Users(
          id: value.id,
          firstname: firstname,
          email: email,
          secondname: secondname);
      _users.add(user);
      notifyListeners();
    });
  }

  void editUsers(
      int index, String firstname, String id, String email, String secondname) {
    var added_Users = FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({
      'email': email,
      'firstName': firstname,
      'secondName': secondname
    }).then((value) {
      Users users =
          new Users(firstname: firstname, email: email, secondname: secondname);
      _users[index].firstname = firstname;
      _users[index].email = email;
      _users[index].secondname = secondname;
      notifyListeners();
    });
  }

  // function to remove or delete users by using list index position
  void removeUsers(int index) {
    String id = _users[index].id;
    FirebaseFirestore.instance.collection('users').doc(id).delete();
    _users.removeAt(index);
    notifyListeners();
  }
}

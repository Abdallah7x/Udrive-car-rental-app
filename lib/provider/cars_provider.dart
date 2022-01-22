import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:drive/model/cars.dart';

class CarProviders extends ChangeNotifier {
  //Notes List
  bool _isLoaded = false;
  List<Car> _car = <Car>[];
  List<Car> get getCar {
    return _car;
  }

  Future<void> getCarsCollectionFromFirebase() async {
    if (_car.isNotEmpty) return;
    FirebaseFirestore _instance = FirebaseFirestore.instance;

    CollectionReference cars = _instance.collection("adds");
    QuerySnapshot querySnapshot = await cars.get();
    final allData = List.from(
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id}));
    for (var element in allData) {
      notifyListeners();
      Car car = Car.fromJson(element);
      _car.add(car);
      _isLoaded = true;
    }
  }

// function to add data to list of notes
  void addCar(String name, String number, String type, String rate) {
    var added_car = FirebaseFirestore.instance
        .collection('adds')
        .add({'name': name, 'number': number, 'type':type,'rate':rate}).then((value) {
      Car car = new Car(
          id: value.id, name: name, number: number, type: type, rate: rate);
      _car.add(car);
      notifyListeners();
    });
  }

  void editCar(int index, String id, String name, String number, String type,
      String rate) {
    var added_car = FirebaseFirestore.instance
        .collection('adds')
        .doc(id)
        .update({'name': name, 'number': number}).then((value) {
      Car car = new Car(name: name, number: number, type: type, rate: rate);
      _car[index].name = name;
      _car[index].number = number;
      _car[index].type = type;
      _car[index].rate = rate;
      notifyListeners();
    });
  }

  // function to remove or delete Car by using list index position
  void removeCar(int index) {
    String id = _car[index].id;
    FirebaseFirestore.instance.collection('adds').doc(id).delete();
    _car.removeAt(index);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:drive/model/cars.dart';

class CarProviders extends ChangeNotifier {
  //Notes List
  List<Car> _car = <Car>[];

  List<Car> get getCar {
    return _car;
  }

// function to add data to list of notes
  void addCar(String name, String number, String type, String rate) {
    Car car = new Car(name, number, type, rate);

    _car.add(car);

    notifyListeners();
  }

  // function to remove or delete Car by using list index position
  void removeCar(int index) {
    _car.removeAt(index);
    notifyListeners();
  }
}

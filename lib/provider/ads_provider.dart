import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive/model/ads.dart';
import 'package:flutter/material.dart';
import 'package:drive/model/ads.dart';

class AdsProviders extends ChangeNotifier {
  //Notes List
  List<Ads> _Ads = <Ads>[];

  List<Ads> get getAds {
    return _Ads;
  }

// function to add data to list of notes
  void addAds(String car_name, String car_number, String title, String price) {
    Ads ads = new Ads(car_name, car_number, title, price);
    _Ads.add(ads);

    FirebaseFirestore.instance.collection('adds').add({
      'name': ads.car_name,
      'number': ads.car_number,
      'title': ads.title,
      'price': ads.price
    });

    notifyListeners();
  }

  // function to remove or delete Ads by using list index position
  void removeAds(int index) {
    _Ads.removeAt(index);
    notifyListeners();
  }
}

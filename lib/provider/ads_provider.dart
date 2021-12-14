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
  void addAds(String name, String number, String type, String rate) {
    Ads ads = new Ads(name, number, type, rate);

    _Ads.add(ads);

    notifyListeners();
  }

  // function to remove or delete Ads by using list index position
  void removeAds(int index) {
    _Ads.removeAt(index);
    notifyListeners();
  }
}

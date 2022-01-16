import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class carsservice {
  FirebaseFirestore _instance;
  List<Category> _items = [];
  List<Category> getitems() {
    return _items;
  }

  Future<void> getitemsCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference items = _instance.collection('cars');
    DocumentSnapshot snapshot = await items.doc('cars').get();
    var data = snapshot.data() as Map;
    var itemsdata = data['cars'] as List<dynamic>;
    itemsdata.forEach((itemdata) {});
  }
}

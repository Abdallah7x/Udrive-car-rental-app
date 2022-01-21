import 'package:cloud_firestore/cloud_firestore.dart';

class req {
  void adddate(_dateTime, _dateTimee, _file, _file2, _file3) async {
    await FirebaseFirestore.instance.collection('request').add({
      'pick up date': _dateTime,
      'drop off date': _dateTimee,
      'national id': _file.toString(),
      'Driving liscese': _file2.toString(),
      'House contract': _file3.toString(),
    });
  }
}

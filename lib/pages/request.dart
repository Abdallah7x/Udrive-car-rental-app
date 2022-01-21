import 'package:drive/pages/terms.dart';
import 'package:drive/services/request_service.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class rentrequest extends StatefulWidget {
  @override
  _rentrequest createState() => _rentrequest();
}

class _rentrequest extends State<rentrequest> {
  DateTime _dateTime;
  DateTime _dateTimee;
  File _file;
  File _file2;
  File _file3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          title: Text('Car rent request '),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Please upload these required documents:\n',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "\u2022 " + '   National ID \n'),
                        TextSpan(text: "\u2022 " + '   Driving license \n'),
                        TextSpan(
                            text: "\u2022 " +
                                '   House contract/electricity bill'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Please pick the rent duration:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: <Widget>[
                        Text(_dateTime == null ? ' ' : _dateTime.toString()),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          child: Text('Pick up'),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2500))
                                .then((date1) {
                              setState(() {
                                _dateTime = date1;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: <Widget>[
                        Text(_dateTimee == null ? ' ' : _dateTimee.toString()),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          child: Text('Drop off'),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTimee == null
                                        ? DateTime.now()
                                        : _dateTimee,
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2500))
                                .then((date2) {
                              setState(() {
                                _dateTimee = date2;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Documents upload:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: Text('National ID'),
                        onPressed: () {
                          pickercamera();
                        },
                      ),
                      Center(
                          child: _file == null
                              ? Text("no image uploaded")
                              : Text("uploaded")),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: Text('Driving license'),
                        onPressed: () {
                          pickercamera2();
                        },
                      ),
                      Center(
                        child: _file2 == null
                            ? Text("no image uploaded")
                            : Text('uploaded'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: Text('House contract'),
                        onPressed: () {
                          pickercamera3();
                        },
                      ),
                      Center(
                        child: _file3 == null
                            ? Text("no image uploaded")
                            : Text('uploaded'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                child: Text('Submit request'),
                onPressed: () {
                  req().adddate(_dateTime, _dateTimee, _file, _file2, _file3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => terms_conditions()),
                  );
                },
              )
            ],
          ),
        ));
  }

  void pickercamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
  }

  void pickercamera2() async {
    final myfile2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file2 = File(myfile2.path);
    });
  }

  void pickercamera3() async {
    final myfile3 = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file3 = File(myfile3.path);
    });
  }
}

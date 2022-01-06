import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class rentrequest extends StatefulWidget {
  @override
  _rentrequest createState() => _rentrequest();
}

class _rentrequest extends State<rentrequest> {
  DateTime _dateTime;
  DateTime _dateTimee;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList.length.toString());
    setState(() {});
  }

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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                onPressed: () {
                  selectImages();
                },
                child: Text('Select Images'),
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  Text(
                    "Please pick the rent duration:",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Row(
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
                                .then((date) {
                              setState(() {
                                _dateTime = date;
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
                                .then((date) {
                              setState(() {
                                _dateTimee = date;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

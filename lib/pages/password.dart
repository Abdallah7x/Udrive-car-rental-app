import 'package:drive/pages/home_page.dart';
import 'package:drive/pages/login.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class password extends StatefulWidget {
  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            //form
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints.tightForFinite(),
                      child: Text(
                        'Udrive',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints.tightForFinite(),
                      child: Text(
                        'Set new password',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 22,
                        ),
                      )),

                  //styling
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                  ),
                  //box styling
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  //text input
                  TextFormField(
                    decoration: InputDecoration(labelText: ' New Password'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a password!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),

                  Container(
                      height: 50,
                      width: 800,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: Text('Submit'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      )),
                ]))));
  }
}

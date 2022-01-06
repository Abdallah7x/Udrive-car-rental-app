import 'package:flutter/material.dart';

class terms_conditions extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<terms_conditions> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething() {
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Terms and conditions'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Terms and conditions: :\n\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: "\u2022 " +
                          '  Must be 21 years of age or older. \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          '   A valid driver’s licence for at least one year.  \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          '   Cross Border Rentals are not allowed.\n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          ' A rent contract must be signed before being \n  handed the key. \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          ' It is solely your responsibility to evaluate the car  \n before you sign the contract. \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          '  The car must be recieved/returned with full tank of gas. \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          '  In the event of loosing any car belongings, \n U drive has the right to charge against. \n\n'),
                  TextSpan(
                      text: "\u2022 " +
                          '  Car hire companies reserve the right to refuse handing \n a car to any person who is considered unfit to drive \nor does not meet eligibility requirements.\n\n'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
                activeColor: Colors.red,
              ),
            ),
            Text(
              'I have read and accept terms and conditions',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
            ),
            onPressed: agree ? _doSomething : null,
            child: Text('Send request'))
      ]),
    );
  }
}

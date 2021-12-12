// import 'package:flutter/material.dart';

// class SignupPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//               color: Colors.black,
//             )),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Sign up",
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue.shade900,
//                           ),
//                         ),
//                         // ElevatedButton(
//                         //   child: Text('product details'),
//                         //   onPressed: () {
//                         //     Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(
//                         //           builder: (context) => product_details()),
//                         //     );
//                         //   },
//                         // ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Create an Account",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.blue.shade900,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                      child: Column(
                  
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         const Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Name',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 16),
//                           child: TextFormField(
//                             decoration: const InputDecoration(
//                               border: UnderlineInputBorder(),
//                               labelText: 'E-mail',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 16),
//                           child: TextFormField(
//                             decoration: const InputDecoration(
//                               border: UnderlineInputBorder(),
//                               labelText: 'Age',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               hintText: 'Password',
//                             ),
//                           ),
//                         ),
//                       Padding(
//                       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                       child: Padding(
//                           padding: EdgeInsets.only(top: 3, left: 3),
//                           child: ElevatedButton(
//                               style: ButtonStyle(
//                                      backgroundColor: MaterialStateProperty.all( Colors.blue.shade900)
//                                      ),
//                               child: const Text('Submit'),
//                               onPressed: () {},
//                           ),
//                     ),
//                       ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account? "),
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, fontSize: 18),
//                         ),
//                       ],
//                     )
//                       ]
//                      )
//         )
//                   ])
//               ]
//               )
//               )
//               )
//               )
//               );
//   }
// }

// Widget makeInput({label, obsureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obsureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.blue.shade900,
//             ),
//           ),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue.shade900)),
//         ),
//       ),
//       SizedBox(
//         height: 30,
//       )
//     ],
//   );
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drive/pages/login.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text('Sign up '),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                onChanged: (value) {
                  pass = value;
                },
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade900),
                  ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: pass);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyLogin()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}


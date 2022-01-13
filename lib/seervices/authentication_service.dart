import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  // Future<String?> signup(
  //     {required String email, required String password}) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     return "signed up";
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "weak-password") {
  //       print(e.message);
  //       return e.message;
  //     }
  //   }
  // }
}

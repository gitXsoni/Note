import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  signup(String email, String password) async {
  await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  forgetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}

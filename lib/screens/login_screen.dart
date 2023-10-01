import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_ui/provider/form_provider.dart';
import 'package:login_ui/provider/note_provider.dart';
import 'package:login_ui/utils/text_style_utils.dart';
import 'package:login_ui/widgets/button.dart';
import 'package:login_ui/widgets/image.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<FormProvider>(
        builder: (_, formProvider, __) {
          return SingleChildScrollView(
            key: formProvider.formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    // width: MediaQuery.of(context).size.width,
                    width: double.maxFinite,
                    color: Color(0xffFF7A00),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's start with",
                            style: TextUtils.headerStyle,
                          ),
                          Text("Login", style: TextUtils.headerStyle),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 10),
                    child: Card(
                      elevation: 15,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.44,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("forgot password?"),
                                ],
                              ),
                            ),
                            ButtonScreen(
                              button: "Login",
                              buttonWidth: double.maxFinite,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ImageScreen(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Or",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ButtonScreen(
                    button: "Register",
                    buttonWidth: MediaQuery.of(context).size.width * 0.83,
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}

signinwithgoogle() async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  AuthCredential myCredential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(myCredential);

  debugPrint(user.user?.displayName);
}

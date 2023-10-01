import 'package:flutter/material.dart';
import 'package:login_ui/utils/text_style_utils.dart';
import 'package:login_ui/widgets/button.dart';
import 'package:login_ui/widgets/image.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Color(0xffFF7A00),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lets start with",
                        style: TextUtils.headerStyle,
                      ),
                      Text(
                        "Register",
                        style: TextUtils.headerStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            fillColor: Colors.grey,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            fillColor: Colors.grey,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              ButtonScreen(
                button: "Register",
                buttonWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              SizedBox(height: 20),
              ImageScreen(),
              SizedBox(height: 20),
              ButtonScreen(
                button: "Login",
                buttonWidth: MediaQuery.of(context).size.width * .75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

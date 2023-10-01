import 'package:flutter/material.dart';
import 'package:login_ui/screens/note_screen.dart';
import 'package:login_ui/screens/signup_screen.dart';
import 'package:login_ui/screens/login_screen.dart';
import 'package:login_ui/screens/dummy_screen.dart';
import 'package:login_ui/utils/text_style_utils.dart';

class ButtonScreen extends StatelessWidget {
  final String? button;
  final double? buttonWidth;

  ButtonScreen({super.key, this.button, this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: buttonWidth!,
      decoration: BoxDecoration(
          color: Color(0xff213744), borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {
          if (button == "Login") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else if (button == "Register") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupScreen()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NoteScreen()));
          }
        },
        child: Text(button!, style: TextUtils.headerStyle),
      ),
    );
  }
}

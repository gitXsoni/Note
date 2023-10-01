import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: AssetImage("assets/google.png")),
            Image(image: AssetImage("assets/facebook.png")),
            Image(image: AssetImage("assets/twitter.png")),
          ],
        ),
      ),
    );
  }
}

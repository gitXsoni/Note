import 'package:flutter/material.dart';
import 'package:login_ui/provider/note_details_provider.dart';
import 'package:provider/provider.dart';

import '../screens/note_details.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  const NoteCard({super.key, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final noteDetailsProvider =
            Provider.of<NoteDetailsProvider>(context, listen: false);
        noteDetailsProvider.title = title;
        noteDetailsProvider.description = description;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoteDetails()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 44, 44, 44),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              Text(description,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}

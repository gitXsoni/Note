import 'package:flutter/material.dart';
import 'package:login_ui/models/data_models.dart';
import 'package:login_ui/provider/note_provider.dart';
import 'package:provider/provider.dart';
import '../screens/note_details.dart';

class NoteCard extends StatelessWidget {
  final Notes note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<NoteProvider>(context, listen: false).setCurrentNote(note);
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
              Text(note.title!,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
              Text(note.description!,
                  maxLines: 1,
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

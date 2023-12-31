import 'package:flutter/material.dart';
import 'package:login_ui/models/data_models.dart';
import 'package:login_ui/provider/note_provider.dart';
import 'package:login_ui/screens/note_screen.dart';
import 'package:login_ui/services/database_services.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<NoteProvider>(builder: (_, noteProvider, __) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NoteScreen()));
                              },
                              icon: Icon(Icons.arrow_back_ios),
                              color: Colors.amberAccent,
                            ),
                            Text(
                              "Folders",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Notes notes = Notes(
                                  title: noteProvider.titleNameController.text,
                                  description:
                                      noteProvider.descriptionController.text,
                                );

                                try {
                                  if (noteProvider.curretNote.title == '') {
                                    await noteProvider
                                        .addNote(noteProvider.curretNote);
                                  } else {
                                    await noteProvider.updateNote(
                                        notes, noteProvider.curretNote.id!);
                                  }
                                  noteProvider.addNote(notes);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NoteScreen()));
                                } catch (error) {
                                  print("Error is $error");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              child: Text(
                                noteProvider.curretNote.title == null
                                    ? "Done"
                                    : "Update",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: noteProvider.titleNameController,
                      decoration: InputDecoration(
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    TextFormField(
                      controller: noteProvider.descriptionController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_ui/provider/note_provider.dart';
import 'package:login_ui/screens/add_notes.dart';
import 'package:login_ui/widgets/note_card.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotes()));
        },
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.edit_note_outlined,
          color: Colors.amberAccent,
          size: 40,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Folders",
          style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(
            Icons.more_horiz_rounded,
            color: Colors.amberAccent,
          )
        ],
      ),
      body: Consumer<NoteProvider>(builder: (_, noteProvider, __) {
        // print("The notes are" + noteProvider.fetchNotes().toString());
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 44, 44, 44),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          if (value != "") {
                            noteProvider.searchNote(value);
                          } else {
                            noteProvider.fetchNotes();
                          }
                        },
                        controller: noteProvider.searchController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30,
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: noteProvider.notes.length,
                      itemBuilder: (context, index) {
                        final note = noteProvider.notes[index];
                        return NoteCard(
                          title: note.title!,
                          description: note.description!,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_ui/provider/note_provider.dart';
import 'package:login_ui/screens/add_notes.dart';
import 'package:login_ui/services/database_services.dart';
import 'package:provider/provider.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Icons.upload_file_outlined,
            color: Colors.amberAccent,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_horiz_rounded,
            color: Colors.amberAccent,
            size: 30,
          )
        ],
      ),
      body: Consumer<NoteProvider>(builder: (_, noteProvider, __) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 44, 44, 44)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    noteProvider.curretNote.title ??
                                        "Title not available",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AddNotes()));
                                      },
                                      icon: Icon(Icons.edit),
                                      color: Colors.amberAccent,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        noteProvider.deleteNotes(
                                            noteProvider.curretNote.id!);
                                        Navigator.pop(context);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) => NoteScreen()));
                                      },
                                      icon: Icon(Icons.delete),
                                      color: Colors.amberAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                noteProvider.curretNote.description ??
                                    "Description not available",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

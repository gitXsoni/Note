import 'package:flutter/material.dart';
import 'package:login_ui/models/data_models.dart';
import 'package:login_ui/services/database_services.dart';

class NoteProvider extends ChangeNotifier {
  NoteProvider() {
    fetchNotes();
  }
  TextEditingController searchController = TextEditingController();
  TextEditingController titleNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? id;
  Notes? note;

  List<Notes> notes = [];

  addNote(Notes note) {
    notes.add(note);
    notifyListeners();
  }

  fetchNotes() async {
    notes = await DatabaseServices().fetchNotes();
    notifyListeners();
  }

  searchNote(String search) {
    notes = notes
        .where((note) =>
            note.title
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()) ||
            note.description
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

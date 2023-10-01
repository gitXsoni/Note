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
  


  List<Notes> notes = [];

  Notes _currentNote = Notes();
  Notes get curretNote => _currentNote;

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  setCurrentNote(Notes note) {
    titleNameController.text = note.title ?? '';
    descriptionController.text = note.description ?? '';

    _currentNote = note;
    notifyListeners();
  }

  addNote(Notes note) {
    notes.add(note);
    notifyListeners();
  }

  fetchNotes() async {
    notes = await DatabaseServices().fetchNotes();
    notifyListeners();
  }

  updateNote(Notes note, String id) async {
    await DatabaseServices().updateNotes(note, id);
    fetchNotes();
    notifyListeners();
  }

  deleteNotes(String id) async {
    await DatabaseServices().deleteNotes(id);
    fetchNotes();
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

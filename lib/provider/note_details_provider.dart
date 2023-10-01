import 'package:flutter/material.dart';

import '../models/data_models.dart';
import '../services/database_services.dart';

class NoteDetailsProvider extends ChangeNotifier {
  String? id;
  String? title;
  String? description;
  Notes? note;

  List<Notes> notes = [];

    updateNote(Notes note, String id) async {
    await DatabaseServices().updateNotes(note, id);
    notifyListeners();
  }
    fetchNotes() async {
    notes = await DatabaseServices().fetchNotes();
    notifyListeners();
  }

  deleteNotes(String id) {
    notes.remove(id);
    notifyListeners();
  }


}

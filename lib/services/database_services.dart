import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_ui/models/data_models.dart';

class DatabaseServices {
  var notesCollection = FirebaseFirestore.instance.collection('notes');
  Future<void> addNotes(Notes note) async {
    await notesCollection
        .add(note.toJson())
        .then((value) => print("Successful "))
        .onError((error, stackTrace) =>
            print("Unable to add data because of $error"));
  }

  Future<void> updateNotes(Notes notes, String id) async {
    await notesCollection
        .doc(id)
        .update(notes.toJson())
        .then((value) => print("Successfully updated"))
        .onError((error, stackTrace) =>
            print("Unable to update data because of $error"));
  }

  Future<void> deleteNotes(String id) async {
    await notesCollection
        .doc(id)
        .delete()
        .then((value) => print("Successfully deleted"))
        .onError((error, stackTrace) =>
            print("Unable to delete data because of $error"));
  }

  fetchNotes() async {
    List<Notes> notes = [];

    await notesCollection.get().then((value) {
      value.docs.forEach((doc) {
        Notes note = Notes(
          // id: doc.id,
          title: doc.get('title') ?? "null",
          description: doc.get('description') ?? "null",
        );
        notes.add(note);
      });
    }).onError((error, stackTrace) {
      print(" Unable to fetch because of $error");
    });

    print(notes.length);
    return notes;
  }
}

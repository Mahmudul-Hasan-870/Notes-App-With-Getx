import 'package:get/get.dart';
import 'package:gets/models/notes_model.dart';

class NotesController extends GetxController {
  RxList<NotesModel> notes = <NotesModel>[].obs;

  void addNotes(NotesModel notesModel) {
    notes.add(notesModel);
    update();
  }

  void deleteNotes(int index) {
    // Check if the index is valid
    if (index < 0 || index >= notes.length) {
      Get.snackbar(
        "Error",
        "Invalid index.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Remove the note from the list
    notes.removeAt(index);
    // Update the UI
    update();
    // Show a Snackbar
    Get.snackbar(
      "Note Deleted",
      "Note has been deleted.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateNotes(int id, NotesModel updatedNote) {
    final index = notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      notes[index] = updatedNote;
    }
  }
}

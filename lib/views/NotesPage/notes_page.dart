// notes_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gets/controller/notes_controller.dart';
import 'package:gets/models/notes_model.dart';
import 'package:gets/utils/colors.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    final controller = Get.put(NotesController());

    final arg = Get.arguments as Map<String, dynamic>? ??
        {
          'isUpdate': false,
          'note': null,
        };
    final bool isUpdate = arg['isUpdate'] ?? false;
    final NotesModel? note = arg['note'] as NotesModel?;

    if (isUpdate && note != null) {
      titleController.text = note.title;
      descriptionController.text = note.description;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              minLines: 1,
              keyboardType: TextInputType.text,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                minLines: 5,
                keyboardType: TextInputType.text,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Describe about your notes',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      descriptionController.text.isEmpty) {
                    Get.snackbar(
                        'Error', 'Title and Description are required!');
                  } else {
                    if (isUpdate && note != null) {
                      // Update existing note
                      controller.updateNotes(
                          note.id,
                          NotesModel(
                            id: note.id,
                            title: titleController.text.toString(),
                            description: descriptionController.text.toString(),
                            createdDate: note.createdDate,
                          ));
                    } else {
                      // Add new note
                      controller.addNotes(NotesModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        title: titleController.text.toString(),
                        description: descriptionController.text.toString(),
                        createdDate: DateTime.now(),
                      ));
                    }
                    Get.back();
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

class AddEditStudent extends StatelessWidget {
  AddEditStudent({
    super.key,
  });

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  // void addNote() {
  //   final title = titleController.text.trim();
  //   final note = noteController.text.trim();
  //   service.addNote(title, note);
  //   titleController.clear();
  //   noteController.clear();
  // }

  // updateNote(docId) {
  //   final title = titleController.text.trim();
  //   final note = noteController.text.trim();
  //   service.updateNote(docId, title, note);
  //   titleController.clear();
  //   noteController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    // titleController.text = title ?? '';
    // noteController.text = note ?? '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add or Edit Note',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                focusedBorder: customBorder,
                enabledBorder: customBorder,
                border: customBorder,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: 'Note',
                focusedBorder: customBorder,
                enabledBorder: customBorder,
                border: customBorder,
              ),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                // title == null && docId == null && note == null
                //     ? addNote()
                //     : updateNote(
                //         docId,
                //       );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save_alt),
              label: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  final customBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: mainColor),
  );
}

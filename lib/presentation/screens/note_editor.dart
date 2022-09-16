import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/application/note_provider/note_provider.dart';
import 'package:flutter_firebase_note_app/application/note_provider/note_state.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';
import 'package:flutter_firebase_note_app/style/app_style.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoteEditorScreen extends HookConsumerWidget {
  const NoteEditorScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    int colorId = Random().nextInt(AppStyle.cardsColor.length);
    String date = DateTime.now().toString();
    final titleController = useTextEditingController();
    final mainController = useTextEditingController();

    ref.listen<NoteState>(noteProvider, (previous, next) {
      if (previous?.loading != next.loading && !next.loading) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
        title: const Text(
          'Add a new Note',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 10),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () {
          final create = NoteModel(
              noteTitle: titleController.text,
              noteContent: mainController.text,
              creationDate: date,
              colorId: colorId);

          ref.read(noteProvider.notifier).createNote(note: create);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

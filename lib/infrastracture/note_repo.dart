// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/i_note_repo.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';
import 'package:fpdart/src/unit.dart';
import 'package:fpdart/src/either.dart';

class NoteRepo extends INoteRepo {
  @override
  Future<Either<FailureModel, List<NoteModel>>> getNote(
      {required String userId}) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("User")
          .doc(userId)
          .collection('Notes')
          .orderBy('creation_date')
          .get()
          .then((value) => value.docs.map((e) => NoteModel.fromMap(e.data())));
      return right(data.toList());
    } catch (e) {
      return left(FailureModel(error: e.toString(), tag: 'Get Note'));
    }
  }

  @override
  Future<Either<FailureModel, Unit>> createNote(
      {required NoteModel note, required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(userId)
          .collection("Notes")
          .add(note.toMap());
      return right(unit);
    } catch (e) {
      return left(FailureModel(error: e.toString(), tag: 'Create Note'));
    }
  }
}

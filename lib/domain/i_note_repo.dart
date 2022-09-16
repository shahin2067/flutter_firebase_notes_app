import 'package:clean_api/clean_api.dart';
import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';

abstract class INoteRepo {
  Future<Either<FailureModel, List<NoteModel>>> getNote(
      {required String userId});

  Future<Either<FailureModel, Unit>> createNote(
      {required NoteModel note, required String userId});
}

import 'package:clean_api/clean_api.dart';
import 'package:flutter_firebase_note_app/domain/auth/registration_body.dart';
import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/auth/user_data_model.dart';

abstract class IAuthRepo {
  //Future<Either<FailureModel, List<NoteModel>>> getNote();

  Future<Either<FailureModel, UserData>> signUp(
      RegistrationBody registrationBody);
  Future<Either<FailureModel, UserData>> signIn(
      {required String email, required String password});

  Future<Either<FailureModel, UserData>> tryLogin();
}

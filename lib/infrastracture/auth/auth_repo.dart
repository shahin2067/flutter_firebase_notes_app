// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:clean_api/clean_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_note_app/domain/auth/i_auth_repo.dart';
import 'package:flutter_firebase_note_app/domain/auth/registration_body.dart';
import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/auth/user_data_model.dart';
import 'package:fpdart/src/either.dart';

class AuthRepo extends IAuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Either<FailureModel, UserData>> signUp(
      RegistrationBody registrationBody) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: registrationBody.email,
        password: registrationBody.password,
      );
      final user = UserData(
          name: registrationBody.name,
          email: registrationBody.email,
          age: registrationBody.age,
          userId: credential.user!.uid);
      _db.collection('User').doc(credential.user!.uid).set(user.toMap());
      return right(user);
    } on FirebaseAuthException catch (e) {
      Logger.e(e);
      print('$e');
      return left(FailureModel(error: e.toString(), tag: 'Sign Up'));
    } on FirebaseException catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Sign Up'));
    } catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Sign Up'));
    }
  }

  @override
  Future<Either<FailureModel, UserData>> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user =
          await _db.collection('User').doc(credential.user!.uid).get().then(
                (value) => UserData.fromMap(value.data()!),
              );
      return right(user);
    } on FirebaseAuthException catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Sign In'));
      //return e.message;
    } on FirebaseException catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Sign In'));
    } catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Sign Up'));
    }
  }

  @override
  Future<Either<FailureModel, UserData>> tryLogin() async {
    await Future.delayed(Duration(milliseconds: 500));
    final userId = _auth.currentUser?.uid;
    try {
      if (userId != null) {
        final user = await _db.collection('User').doc(userId).get().then(
              (value) => UserData.fromMap(value.data()!),
            );
        return right(user);
      } else {
        return left(
            FailureModel(error: "User not loggedIn", tag: 'Try Signin'));
      }
    } on FirebaseException catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Try Signin'));
    } catch (e) {
      Logger.e(e);
      return left(FailureModel(error: e.toString(), tag: 'Try Signin'));
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/auth/user_data_model.dart';

class AuthState extends Equatable {
  final bool loading;
  final FailureModel failure;
  final UserData userData;
  const AuthState(
      {required this.loading, required this.failure, required this.userData});

  AuthState copyWith({
    bool? loading,
    FailureModel? failure,
    UserData? userData,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      userData: userData ?? this.userData,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [loading, failure];

  factory AuthState.init() => AuthState(
      loading: false, failure: FailureModel.init(), userData: UserData.init());
}

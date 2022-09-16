import 'package:flutter_firebase_note_app/application/auth/auth_state.dart';
import 'package:flutter_firebase_note_app/domain/auth/i_auth_repo.dart';
import 'package:flutter_firebase_note_app/domain/auth/registration_body.dart';
import 'package:flutter_firebase_note_app/infrastracture/auth/auth_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepo());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepo authRepo;
  AuthNotifier(this.authRepo) : super(AuthState.init());

  signUp(RegistrationBody registrationBody) async {
    state = state.copyWith(loading: true);
    final data = await authRepo.signUp(registrationBody);
    state = data.fold(
        (l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(
              loading: false,
            ));
  }

  signIn({required String email, required String password}) async {
    state = state.copyWith(loading: true);
    final data = await authRepo.signIn(email: email, password: password);
    state = data.fold(
        (l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(
              loading: false,
            ));
  }

  tryLogin() async {
    state = state.copyWith(loading: true);
    final data = await authRepo.tryLogin();

    state = data.fold((l) => state.copyWith(loading: false),
        (r) => state.copyWith(loading: false, userData: r));
  }
}

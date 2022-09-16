import 'package:flutter_firebase_note_app/application/auth/auth_provider.dart';
import 'package:flutter_firebase_note_app/application/note_provider/note_state.dart';
import 'package:flutter_firebase_note_app/domain/i_note_repo.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';
import 'package:flutter_firebase_note_app/infrastracture/note_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final noteProvider = StateNotifierProvider<NoteNotifier, NoteState>((ref) {
  final String userId =
      ref.watch(authProvider.select((value) => value.userData.userId));
  return NoteNotifier(NoteRepo(), userId);
});

class NoteNotifier extends StateNotifier<NoteState> {
  final String userId;
  final INoteRepo noteRepo;
  NoteNotifier(this.noteRepo, this.userId) : super(NoteState.init());
  getNote() async {
    state = state.copyWith(loading: true);
    final data = await noteRepo.getNote(userId: userId);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(loading: false, notess: r),
    );
  }

  createNote({required NoteModel note}) async {
    //final String userId;
    state = state.copyWith(loading: true);
    final data = await noteRepo.createNote(note: note, userId: userId);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(loading: false),
    );
    getNote();
  }
}

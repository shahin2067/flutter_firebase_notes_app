import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_note_app/domain/failure_model.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';

class NoteState extends Equatable {
  final bool loading;
  final FailureModel failure;
  final List<NoteModel> notess;
  const NoteState({
    required this.loading,
    required this.failure,
    required this.notess,
  });

  NoteState copyWith({
    bool? loading,
    FailureModel? failure,
    List<NoteModel>? notess,
  }) {
    return NoteState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      notess: notess ?? this.notess,
    );
  }

  @override
  String toString() =>
      'NoteState(loading: $loading, failure: $failure, notess: $notess)';

  @override
  List<Object> get props => [loading, failure, notess];
  factory NoteState.init() => NoteState(
        loading: false,
        failure: FailureModel.init(),
        notess: [NoteModel.init()],
      );
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String noteTitle;
  final String noteContent;
  final String creationDate;
  final int colorId;
  const NoteModel({
    required this.noteTitle,
    required this.noteContent,
    required this.creationDate,
    required this.colorId,
  });

  NoteModel copyWith({
    String? noteTitle,
    String? noteContent,
    String? creationDate,
    int? colorId,
  }) {
    return NoteModel(
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      creationDate: creationDate ?? this.creationDate,
      colorId: colorId ?? this.colorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note_title': noteTitle,
      'note_content': noteContent,
      'creation_date': creationDate,
      'color_id': colorId,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      noteTitle: map['note_title'] ?? '',
      noteContent: map['note_content'] ?? '',
      creationDate: map['creation_date'] ?? '',
      colorId: map['color_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteModel(noteTitle: $noteTitle, noteContent: $noteContent, creationDate: $creationDate, colorId: $colorId)';
  }

  @override
  List<Object> get props => [noteTitle, noteContent, creationDate, colorId];
  factory NoteModel.init() => const NoteModel(
        noteTitle: '',
        noteContent: '',
        creationDate: '',
        colorId: 0,
      );
}

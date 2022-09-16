import 'dart:convert';
import 'package:equatable/equatable.dart';

class FailureModel extends Equatable {
  final String tag;
  final String error;
  const FailureModel({
    required this.tag,
    required this.error,
  });

  FailureModel copyWith({
    String? tag,
    String? error,
  }) {
    return FailureModel(
      tag: tag ?? this.tag,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'error': error,
    };
  }

  factory FailureModel.fromMap(Map<String, dynamic> map) {
    return FailureModel(
      tag: map['tag'] ?? '',
      error: map['error'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FailureModel.fromJson(String source) =>
      FailureModel.fromMap(json.decode(source));

  @override
  String toString() => 'FailureModel(tag: $tag, error: $error)';

  @override
  List<Object> get props => [tag, error];
  factory FailureModel.init() => const FailureModel(
        tag: '',
        error: '',
      );
}

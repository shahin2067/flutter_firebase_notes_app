// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String name;
  final String email;
  final int age;
  final String userId;
  const UserData({
    required this.name,
    required this.email,
    required this.age,
    required this.userId,
  });

  UserData copyWith({
    String? name,
    String? email,
    int? age,
    String? userId,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'age': age,
      'userId': userId,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, email, age, userId];

  factory UserData.init() =>
      const UserData(name: '', email: '', age: 0, userId: '');
}

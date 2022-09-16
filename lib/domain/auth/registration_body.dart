// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegistrationBody extends Equatable {
  final String name;
  final String email;
  final int age;
  final String password;
  const RegistrationBody({
    required this.name,
    required this.email,
    required this.age,
    required this.password,
  });

  RegistrationBody copyWith({
    String? name,
    String? email,
    int? age,
    String? password,
  }) {
    return RegistrationBody(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'age': age,
      'password': password,
    };
  }

  factory RegistrationBody.fromMap(Map<String, dynamic> map) {
    return RegistrationBody(
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationBody.fromJson(String source) =>
      RegistrationBody.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, email, age, password];
}

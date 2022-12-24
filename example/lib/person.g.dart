// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

class PersonGen {
  final String name;
  final String lastName;
  final bool isAdult;
  final int age;
  const PersonGen({
    required this.name,
    required this.lastName,
    required this.isAdult,
    required this.age,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastName': lastName,
      'isAdult': isAdult,
      'age': age,
    };
  }

  factory PersonGen.fromMap(Map<String, dynamic> map) {
    return PersonGen(
      name: map['name'],
      lastName: map['lastName'],
      isAdult: map['isAdult'],
      age: map['age'],
    );
  }
  PersonGen copyWith({
    String? name,
    String? lastName,
    bool? isAdult,
    int? age,
  }) {
    return PersonGen(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      isAdult: isAdult ?? this.isAdult,
      age: age ?? this.age,
    );
  }
}

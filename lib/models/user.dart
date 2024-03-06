import 'package:baitapapi/models/user_dob.dart';
import 'package:baitapapi/models/user_name.dart';
import 'package:flutter/material.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.nat,
      required this.cell,
      required this.name,
      required this.dob});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}

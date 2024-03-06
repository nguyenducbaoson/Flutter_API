import 'dart:convert';

import 'package:baitapapi/models/user.dart';
import 'package:baitapapi/models/user_dob.dart';
import 'package:baitapapi/models/user_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserAPI{
    static Future<List<User>> fetchUsers() async {
    print('fetchUser called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e){
      final name  = UserName(
        title: e['name']['title'],
         first: e['name']['first'], last: e['name']['last']);
      final dob = UserDob(
        date:e['dob']['date'], 
        age: e['dob']['age']
        );
      return User(gender: e['gender'], email: e['email'], phone: e['phone'], nat: e['nat'], cell: e['cell'], name: name, dob: dob);
    }).toList();
    return users;
  }
}
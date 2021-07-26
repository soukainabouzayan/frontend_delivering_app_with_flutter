import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/models/user.dart';
import 'package:login/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  final String url = 'http://localhost:8000/api';
  var status;
  var token = '3|YJFE2rm7uTiUOz9RN2TmQySTqouc0jz0hWAdYIiH';
  late User user;

  Future<int> login(String email, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    String uri = '${this.url}/login';
    http.Response resp = await http.post(Uri.parse(uri), headers: {
      'Accept': 'application/json',
    }, body: {
      "email": email,
      "password": pass,
    });
    print(resp.body);
    /*prefs.setString('user', jsonDecode(resp.body)['user']);
    prefs.setString('token', jsonDecode(resp.body)['token']);*/

    /*ynamic userJson = prefs.getString('user');
    User user = User.fromJson(jsonDecode(userJson));
    String? token = prefs.getString('token');
    print(token);
    print(user);*/
    print(resp.statusCode);


    return resp.statusCode;
  }

  Future<String> register(int id) async {
    String uri = '${this.url}/plat/$id';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${this.token}',
    });
    return resp.body;
  }

  Future<List> logout(String input) async {
    String uri = '${this.url}/plat/search/$input';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${this.token}'
    });
    return json.decode(resp.body);
  }

// _save(String token) async {
//   final prefs = await SharedPreferences.getInstance();

// }
}

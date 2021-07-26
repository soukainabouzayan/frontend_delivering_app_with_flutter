import 'dart:convert';

import 'package:login/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpController{
  final String url = 'http://localhost:8000/api';
  var status;
  var token = '3|YJFE2rm7uTiUOz9RN2TmQySTqouc0jz0hWAdYIiH';
  late User user;
  Future<int> register(String nom, String prenom, String email, String tel,
      String adresse, String pass, String passConfirmed) async {
    final prefs = await SharedPreferences.getInstance();
    String uri = '${this.url}/register';

    http.Response resp = await http.post(Uri.parse(uri), headers: {
      'Accept': 'application/json',
    }, body: {
      "nom": nom,
      "prenom": prenom,
      "tel": tel,
      "adresse": adresse,
      "email": email,
      "password": pass,
      "password_confirmation": passConfirmed
    });

    prefs.setString('user', jsonDecode(resp.body)['user']);
    prefs.setString('token', jsonDecode(resp.body)['token']);
    return resp.statusCode;
  }
}
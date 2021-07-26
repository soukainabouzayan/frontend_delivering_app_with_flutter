import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/models/user.dart';

class PlatController {
  final String url = 'http://127.0.0.1:8000/api';
  var status;
  var token = '3|YJFE2rm7uTiUOz9RN2TmQySTqouc0jz0hWAdYIiH';
  late User user;

  Future<String> getPlats() async {
    String uri = '${this.url}/plat';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${this.token}'
    });
    return resp.body;
  }

  Future<String> getPlatById(int id) async {
    String uri = '${this.url}/plat/$id';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${this.token}',
    });
    return resp.body;
  }

  Future<List> search(String input) async {
    String uri = '${this.url}/plat/search/$input';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${this.token}'
    });
    return json.decode(resp.body);
  }
}

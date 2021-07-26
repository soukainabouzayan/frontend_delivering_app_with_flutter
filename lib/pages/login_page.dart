import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/controllers/user_controller.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/loginerror.dart';
import 'package:login/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<List<Plat>> getPlats() async{
  String token = '45|MiImdbKBQ21zmcqZn3ukIdFkCFqnyHYVLw9mB2EY';
  final String url = 'http://localhost:8000/api/plat';
  final prefs = await SharedPreferences.getInstance();
  http.Response resp = await http.get(Uri.parse(url), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  }, );
  print(resp.body);
  /*prefs.setString('user', jsonDecode(resp.body)['user']);
    prefs.setString('token', jsonDecode(resp.body)['token']);*/

  /*ynamic userJson = prefs.getString('user');
    User user = User.fromJson(jsonDecode(userJson));
    String? token = prefs.getString('token');
    print(token);
    print(user);*/
  var listJson = jsonDecode(resp.body) as List;
  List<Plat> listPlat =
  listJson.map((platJson) => Plat.fromJson(platJson)).toList();
  print(resp.statusCode);
  print(listPlat[0]);

  return listPlat;
}
class LoginPage extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginPage> {
  final String url = 'http://localhost:8000/api';
  var _email;
  var _password;
  final emailCon =new TextEditingController();
  final passwordCon =new TextEditingController();
  final UserController userController=new UserController();
  bool login(String email,String pass){
    if(userController.login(email, pass)==200){
      return true;
    }
    else
      return false;
  }

  Future<int> loginn(String email, String pass) async {
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
    if (resp.statusCode==200){
      List<Plat> p ;
      getPlats().then((plats) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomePage(plats)));
      });
    } else{
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginErrorPage()));

    }

    return resp.statusCode;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
            child: Text("GOURMAND PLACE",style: TextStyle(color: Colors.deepOrange),)),
      ),*/
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.all(20),
            child: Text('GOURMAND PLACE',style: TextStyle(color: Colors.deepOrange,fontWeight:FontWeight.bold,fontSize: 30),),
          ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.only(top: 50,left: 12,right: 12 ),
              child: TextField(
                controller: emailCon,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordCon,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _email=emailCon.text;
                    _password=passwordCon.text;
                      loginn(_email, _password);

                },  );},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new SignUpPage())),
                child: Text('New User? Create Account',style : TextStyle( color: Colors.deepOrange),)
            ),

          ],
        ),
      ),
    );
  }
}
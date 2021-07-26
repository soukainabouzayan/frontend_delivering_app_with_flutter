import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/loginerror.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class SignUpPage extends StatefulWidget {
  @override
  _SignUpDemoState createState() => _SignUpDemoState();
}

class _SignUpDemoState extends State<SignUpPage> {

  final String url = 'http://localhost:8000/api';
  var _prenom;
  var _nom;
  var _tel;
  var _adresse;
  var _email;
  var _password;
  var _passwordConfirmation;
  final prenomCon =new TextEditingController();
  final nomCon =new TextEditingController();
  final telephoneCon =new TextEditingController();
  final adresseCon =new TextEditingController();
  final emailCon =new TextEditingController();
  final passwordCon =new TextEditingController();
  final passwordConfirmationCon =new TextEditingController();
  Future<int> register(String nom, String prenom, String email, String tel,
      String adresse, String pass, String passConfirmed) async {
    //final prefs = await SharedPreferences.getInstance();
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

    //prefs.setString('user', jsonDecode(resp.body)['user']);
    //prefs.setString('token', jsonDecode(resp.body)['token']);
    print(resp.statusCode);
    print(resp.body);

    if (resp.statusCode==201){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginPage()));
    } else{
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginErrorPage()));

    }
    return resp.statusCode;
  }
  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Align(alignment: Alignment.center,
            child: Text('Inscription',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
      ),
        body: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
            width: double.infinity,
            height: double.infinity,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: TextField(
                              controller: prenomCon,
                              showCursor: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "Prénom",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              controller: nomCon,
                              showCursor: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "Nom",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: telephoneCon,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.orangeAccent,
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          hintText: "Numéro de téléphone",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: adresseCon,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.orangeAccent,
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Adresse",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: emailCon,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.orangeAccent,
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: passwordCon,
                        obscureText: true,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.orangeAccent,
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Mot De Passe",
                        ),
                      ),SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: passwordConfirmationCon,
                        showCursor: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.orangeAccent,
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          hintText: "Confirmation de Mot de Passe",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange, borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: (){
                           setState((){
                             _prenom=prenomCon.text;
                             _nom=nomCon.text;
                             _tel=telephoneCon.text;
                             _adresse=adresseCon.text;
                             _email=emailCon.text;
                             _password=passwordCon.text;
                             _passwordConfirmation=passwordConfirmationCon.text;
                             print(_password);
                             print(_passwordConfirmation);
                             register(_nom, _prenom, _email, _tel, _adresse, _password, _passwordConfirmation);
                           });
                          },
                          child: Text(
                            'Inscription',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}

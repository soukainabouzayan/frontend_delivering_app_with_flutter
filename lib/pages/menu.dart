import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/category_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class  MenuPage extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<MenuPage> {


  Future<List<Plat>> getPlatsByCategorie(cat) async{
    String token = '45|MiImdbKBQ21zmcqZn3ukIdFkCFqnyHYVLw9mB2EY';
    final String url = 'http://localhost:8000/api/categorie';
    final prefs = await SharedPreferences.getInstance();
    String uri = '$url/$cat';
    http.Response resp = await http.get(Uri.parse(uri), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, );
    print(resp.body);
    var listJson = jsonDecode(resp.body) as List;
    List<Plat> listPlat =
      listJson.map((platJson) => Plat.fromJson(platJson)).toList();
    print(resp.statusCode);
    print(listPlat[0]);

    return listPlat;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Menu"),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              getPlatsByCategorie("salade").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("salade", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/salade.jpeg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Salade"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("pizza").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("pizza", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/pizzaviandehachee.jpg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Pizza"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("burger").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("burger", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/burger.jpg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Burger"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("tacos").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("tacos", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/tacosmixte.jpeg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Tacos"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("pats").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("pats", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/tagliatellepoulet.jpg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Pates"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("dessert").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("dessert", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/cheesecake.jpg",width: 40),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Dessert"),
            ),
          ),
          InkWell(
            onTap: (){
              getPlatsByCategorie("jus").then((plats) {

                Navigator
                    .of(context).push(new MaterialPageRoute(builder: (context)=> new CategoryPage("jus", plats)));
              });
            },
            child: ListTile(
              leading: Image.asset("assets/images/jus.jpg",width: 40,),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Jus"),
            ),
          )
        ],
      ),
    );
  }
}

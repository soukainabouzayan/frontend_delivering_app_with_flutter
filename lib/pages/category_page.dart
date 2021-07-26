import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/loginerror.dart';
import 'package:login/pages/plat_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
double somme=0;
late List<Plat> plats;
late String category;

class  CategoryPage extends StatefulWidget {


  @override
  _State createState() => _State();

  CategoryPage(String cat,List<Plat> list ){
    category=cat;
    plats = list;

  }
}

class _State extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Nos $category"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: plats.length,
            itemBuilder: (_,index){
              return Container(
                height: 350,
                decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.orangeAccent,
                          offset: Offset(1,1),
                          blurRadius:4
                      )
                    ]
                ) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new PlatPage(plats[index])));
                            },
                              child: Image.asset("assets/images/${plats[index].image}",height: 200,width: 500,))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${plats[index].name}      Prix : ${plats[index].price}DH",style : TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: (){
                                //somme=somme+price;
                              },
                              icon:Icon(Icons.add_shopping_cart),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: (){
                                //somme=somme+price;
                              },
                              icon:Icon(Icons.remove_shopping_cart),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        child: Container(
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.purple,
                                    offset: Offset(1,1),
                                    blurRadius:4
                                )
                              ]
                          ) ,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Description : ${plats[index].description}",style : TextStyle( color: Colors.purple),)
                            ),
                          ),
                        ))


                  ],

                ),

              );
            }),
      ),
    );
  }
}
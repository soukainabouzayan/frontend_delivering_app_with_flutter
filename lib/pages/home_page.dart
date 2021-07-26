import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login/models/cart_item.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/card_page.dart';
import 'package:login/pages/menu.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/plat_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'loginerror.dart';

//late List<Plat> plats ;

String title="Nos Plats";
late var qte;
late var prixTotal;
late List<CartItem> cartItems;
late List<Plat> plats;

class HomePage extends StatefulWidget {
  HomePage(List<Plat> listPlat){
    plats = listPlat;
  }
  @override
  _HomeDemoState createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomePage> {

  Future<List<Plat>> search(searchText) async{
    String token = '45|MiImdbKBQ21zmcqZn3ukIdFkCFqnyHYVLw9mB2EY';
    final String url = 'http://localhost:8000/api/plat';
    final prefs = await SharedPreferences.getInstance();
    String uri = '$url/search/$searchText';
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
    title = "$searchText resultats:";
    if (resp.statusCode==200){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomePage(listPlat)));
    } else{
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginErrorPage()));
    }

    return listPlat;
  }
  var searchText;
  final searchCon=TextEditingController();

    Future<int> addToCart(id) async{
      String token = '45|MiImdbKBQ21zmcqZn3ukIdFkCFqnyHYVLw9mB2EY';
      final String url = 'http://localhost:8000/api/plat';
      final prefs = await SharedPreferences.getInstance();
      String uri = '$url/add/$id';
      http.Response resp = await http.get(Uri.parse(uri), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, );
      print(resp.body);
      //String listJson = ;
      var listJson = jsonDecode(resp.body)['plats'] as List;
      prixTotal = jsonDecode(resp.body)['prixTotal'] as double;
      qte = jsonDecode(resp.body)['qte'] as int;
      cartItems =
        listJson.map((platJson) => CartItem.fromJson(platJson)).toList();
      print(cartItems[0]);
      print(prixTotal);
      print(qte);
      if (resp.statusCode==200){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomePage(plats)));
      } else{
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginErrorPage()));
      }

      return resp.statusCode;
    }
  void removeFromCart(){

  }


  Future<int> getCart() async{
    String token = '45|MiImdbKBQ21zmcqZn3ukIdFkCFqnyHYVLw9mB2EY';
    final String url = 'http://localhost:8000/api/plat/cart';
    final prefs = await SharedPreferences.getInstance();
    http.Response resp = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, );
    print(resp.body);
    //String listJson = ;
    var listJson = jsonDecode(resp.body)['plats'] as List;
    prixTotal = jsonDecode(resp.body)['prixTotal'] as double;
    qte = jsonDecode(resp.body)['qte'] as int;
    cartItems =
      listJson.map((platJson) => CartItem.fromJson(platJson)).toList();
    print(cartItems[0]);
    print(prixTotal);
    print(qte);
    if (resp.statusCode==200){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomePage(plats)));
    } else{
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginErrorPage()));
    }

    return resp.statusCode;
  }
  late Plat plat;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(7.0),
                    child:Text('GOURMAND PLACE',style: TextStyle(fontSize: 20 , color: Colors.deepOrange),)),
                IconButton(
                    onPressed :(){
                      getCart();
                      print('=================== $cartItems[0]');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartPage(qte, prixTotal, cartItems)));
                }, icon: Icon(Icons.shopping_cart,color: Colors.black26)),
                IconButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                }, icon: Icon(Icons.logout,color: Colors.black26)),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(onPressed :(){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MenuPage()));
                    }, icon: Icon(Icons.menu,color: Colors.black26)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange,
                      offset: Offset(1,1),
                      blurRadius:4
                    )
                  ]
                ) ,
                
                child: ListTile(
                  leading: IconButton(
                           icon: Icon(Icons.arrow_back_outlined,color: Colors.black26,),
                           onPressed: () {

                           }),


                  title: TextField(
                    controller: searchCon,
                    decoration: InputDecoration(
                      hintText: "Recherche",
                      border: InputBorder.none
                    ),
                  ),
                  trailing: Container(
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          searchText=searchCon.text;
                          search(searchText);
                        });
                      },
                        icon: Icon(Icons.search,color: Colors.deepOrange,)),
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(padding: const EdgeInsets.all(7.0),
                child:Text(title,style: TextStyle(fontSize: 20,color:Colors.black54),)),
          Padding(padding: EdgeInsets.all(10),
                  child:   Container(
            height: 420,
              child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: plats.length,
                        itemBuilder: (_,index){
                          return Container(
                            height: 300,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.deepOrange,
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
                                        child: Text("${plats[index].name}      Prix : ${plats[index].price  }DH",style : TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              addToCart(plats[index].id);
                                            });
                                            //somme=somme+price;
                                          },
                                          icon:Icon(Icons.add_shopping_cart,color: Colors.deepOrangeAccent),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: (){
                                            removeFromCart();
                                            //somme=somme-price;
                                          },
                                          icon:Icon(Icons.remove_shopping_cart,color: Colors.deepOrangeAccent),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],

                            ),

                          );
                        }),
            ),
            )

          ],

        ),
      )

    );
    throw UnimplementedError();
  }

}
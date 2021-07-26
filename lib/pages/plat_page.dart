import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/login_page.dart';
double somme=0;
Plat plat = new   Plat(id: 1, name: "Burger", description: "Tomates,Poivrons verts,Ail,Oignons rouges,Oeufs durs,Thon.....", image: "burger.jpg", price: 28,categorie: "burger");

class  PlatPage extends StatefulWidget {

  @override
  _State createState() => _State();

  PlatPage(Plat p){
    plat=p;
  }
}

class _State extends State<PlatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Align(
            alignment: Alignment.center,
            child: Text(plat.name,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/${plat.image}"),
                fit: BoxFit.cover,
              ),
            ),
            height: 350,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(120.0),
              child:
              Text(''),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description : ${plat.description}',style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Text(
              'Price: ${plat.price} DH',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:login/models/cart_item.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/paiement_page.dart';
/*List<Plat> plats=[
  Plat(id: 1, name: "Salade Néçoise", description: "Tomates,Poivrons verts,Ail,Oignons rouges,Oeufs durs,Thon.....", image: "saladenéçoise.jpg", price: 28,categorie: "salade"),
  Plat(id: 2, name: "Salade Marocaine", description: "Tomates,Oignon,Concombre,Persil plat.....", image: "salademarocaine.jpg", price: 12,categorie: "salade"),
  Plat(id: 2, name: "Zaalouk", description: "Aubergines,Tomates,Ail...", image: "zaalouk.jpg", price: 12,categorie: "salade"),
  Plat(id: 2, name: "Taktouka", description: "Poivrons rouges,Tomates,Ail.....", image: "taktouka.jpg", price: 12,categorie: "salade"),
];*/
late int qte;
late double prixTotal;
late List<CartItem> cartItems;
class CartPage extends StatefulWidget {

  CartPage(qt, prixTo,List<CartItem> list){
    qte = qt;
    prixTotal = prixTo;
    cartItems = list;
  }

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.deepOrange,
            title: Align(
                alignment: Alignment.center,
                child: Text('Votre Panier', style: TextStyle(color: Colors.white),)),
            expandedHeight: 50.0,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, int) {
                return Card(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cartItems.length,
                      itemBuilder: (_,index){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("PU : ${cartItems[index].plat.price} DH", style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),),
                              Text("Qte : ${cartItems[index].qte}",style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500)),
                              InkWell(
                                child:Icon(
                                  Icons.remove_shopping_cart,
                                  color: Colors.orangeAccent,
                                  size: 30.0 ,
                                ),
                                onTap: (){
                                },
                              )
                            ],
                        );
                          // ignore: unnecessary_statements

                      }
                  ),
                );
              }, childCount: 1)),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('Total  :  $prixTotal DH ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.orange),)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PaymentPage()));
          },
          color: Colors.deepOrange,
          textColor: Colors.white,
          child: Text('Valider'),
        ),
      ),
    );
  }}

import 'package:flutter/material.dart';
import 'package:login/models/plat.dart';
import 'package:login/pages/category_page.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/loginerror.dart';
List<Plat> list=[
  Plat(id: 1, name: "Salade Néçoise", description: "Tomates,Poivrons verts,Ail,Oignons rouges,Oeufs durs,Thon.....", image: "saladenéçoise.jpg", price: 28,categorie: "salade"),
  Plat(id: 2, name: "Salade Marocaine", description: "Tomates,Oignon,Concombre,Persil plat.....", image: "salademarocaine.jpg", price: 12,categorie: "salade"),
  Plat(id: 2, name: "Zaalouk", description: "Aubergines,Tomates,Ail...", image: "zaalouk.jpg", price: 12,categorie: "salade"),
  Plat(id: 2, name: "Taktouka", description: "Poivrons rouges,Tomates,Ail.....", image: "taktouka.jpg", price: 12,categorie: "salade"),
];

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
    );
  }
}


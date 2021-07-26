import 'package:flutter/material.dart';
import 'package:login/models/category.dart';
import 'package:login/widgets/custom_text.dart';
List<Category> categoriesList=[
  Category(name: "SALADES", image: "burger.jpg"),
  Category(name: "PIZZA", image: "pizzaviandehachee.jpg"),
  Category(name: "BURGERS", image: "tagliatellepoulet.jpg"),
  Category(name: "TACOS", image: "tacosmixte.jpeg"),
  Category(name: "PATES", image: "cheesecake.jpg"),
  Category(name: "DESSERT", image: "salade.jpeg"),
  Category(name: "JUS", image: "jus.jpg")
];

class Categories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                    decoration:BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.purple,
                              offset: Offset(1,1),
                              blurRadius:4
                          )
                        ]
                    ),
                    child: Image.asset("assets/images/${categoriesList[index].image}",width:20)

                ),
                SizedBox(height: 5,),
                CustomText(text: categoriesList[index].name, size : 16, colors : Colors.black, weight: FontWeight.bold)

              ],
            ),
          );
        },
      ),
    );
  }
}

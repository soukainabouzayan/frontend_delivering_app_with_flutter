import 'package:flutter/material.dart';
class Plat{
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String categorie;


  Plat({required this.id,required this.name,required this.description,required this.image,required this.price,required this.categorie});
  Plat.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['nom'],
        description = json['description'],
        price = json['prix'],
        categorie = json['categorie'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': name,
    'description': description,
    'prix': price,
    'categorie': categorie,
    'image': image,
  };

  @override
  String toString() {
    return '{ ${this.id}, ${this.name}, ${this.price}, ${this.image}, ${this.description}, ${this.categorie} }';
  }
}
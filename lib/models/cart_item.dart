

import 'package:login/models/plat.dart';

class CartItem{
  final Plat plat;
  final double prixQte;
  final int qte;

  CartItem.fromJson(Map<String, dynamic> json)
      : qte = json['qte'] as int,
        prixQte = json['prix'],
        plat = Plat.fromJson(json['plat']);

  Map<String, dynamic> toJson() => {
    'qte': qte,
    'prix': prixQte,
    'plat': plat,
  };

  @override
  String toString() {
    return '{ ${this.plat}, ${this.prixQte}, ${this.qte} }';
  }
}
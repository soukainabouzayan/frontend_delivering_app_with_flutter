import 'package:flutter/cupertino.dart';
import 'package:login/models/plat.dart';

class Cart extends ChangeNotifier{
  List<Plat> _plats=[];
  double _totalPrice = 0.0;
  void add(Plat plat) {
    _plats.add(plat);
    _totalPrice += plat.price;
    notifyListeners();
  }
  void remove(Plat plat) {
    _plats.remove(plat);
    _totalPrice -= plat.price;
    notifyListeners();
  }
  double get totlaPrice{
    return _totalPrice;
  }
  List<Plat> get basketPlat{
    return _plats;
  }
}
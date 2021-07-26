import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late  String text;
  late  double size;
  late  Color colors;
  late  FontWeight weight;
  CustomText( {required String this.text,required  FontWeight this.weight,required  Color colors, required double size}) {
    this.text= text;
    this.size = size;
    this.colors = colors;
    this.weight = weight;
  }

  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(fontSize: size,color: colors,fontWeight: weight ) ,);
  }
}
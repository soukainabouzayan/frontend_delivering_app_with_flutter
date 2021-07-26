import 'package:flutter/material.dart';
class Card{
  final String cardNumber;
  final String expiryDate;
  final int cvc;
  Card({required this.cardNumber,required this.expiryDate,required this.cvc});
}
import 'package:flutter/material.dart';
class PaymentPage extends StatefulWidget {

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text('PAIEMENT', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            ElevatedButton(onPressed: (){},
                child: Text('Payer à la livraison')),
            ElevatedButton(onPressed: (){

            },
                child: Text('Payer par carte'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class Payment_Page extends StatefulWidget {

  @override
  _Payment_PageState createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 160),
            child: Icon(Icons.monetization_on_outlined,size: 100,color: Colors.deepOrange,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(onPressed: (){}, child: Text('Payer à la livraison')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(onPressed: (){}, child: Text('Payer Par Carte ')),
          )


        ],
      ),
    );
  }
}

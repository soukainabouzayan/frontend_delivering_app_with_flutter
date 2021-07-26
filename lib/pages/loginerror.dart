import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
class LoginErrorPage extends StatefulWidget {

  @override
  _LoginErrorPageState createState() => _LoginErrorPageState();
}

class _LoginErrorPageState extends State<LoginErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: Column (
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 160),
              child: Icon(Icons.error_outline,size: 100,),
            ),
            Padding(
              child: Text('ERROR',style: TextStyle(color: Colors.red,fontSize: 60,fontWeight: FontWeight.bold),),
                padding: EdgeInsets.all(12)),
            Padding(
                child: IconButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                }, icon: Icon(Icons.arrow_back_outlined,color: Colors.black26)),
                padding: EdgeInsets.only(bottom: 100))
          ],

        ),
      ),
    );
  }
}


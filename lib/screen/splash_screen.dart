import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(children: <Widget>[
        //Insere Logo theGoodBot
        new Image.asset(
          'branco.png',
          height: 100,
        ),
        new Padding(
            padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
            child: Text("Seu companheiro de isolamento",
                style: TextStyle(color: Colors.white, fontSize: 40))),
        new Padding(
            padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
            child: Text("Gustavo Duregger, Murilo Melo, Yan Alexandre",
                style: TextStyle(color: Colors.white70, fontSize: 15))),
        new Padding(
          padding: new EdgeInsets.only(left: 35, right: 35, top: 20.0),
        ),
        new Image.asset(
          'roboto.gif',
          height: 300,
        ),
        new SizedBox(
            width: 50.0,
            height: 130.0,
            child: new ButtonTheme(
                child: new RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              textColor: Colors.white,
              color: Colors.deepPurpleAccent,
              elevation: 10,
              child: new Text(
                "Dar oi ao TGB",
                style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/homescreen",
                );
              },
            ))),
      ])),
      //OUTROS ELEMENTOS
      backgroundColor: Color.fromRGBO(92, 156, 251, 1),
    );
  }
}

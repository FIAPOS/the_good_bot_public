import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SaudeScreen extends StatefulWidget {
  @override
  _SaudeScreenState createState() => _SaudeScreenState();
}

class _SaudeScreenState extends State<SaudeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[700], //change your color here
        ),
        backgroundColor: Colors.grey[100],
        title: //Insere Logo theGoodBot
            new Image.asset(
          'banner.png',
          height: 60,
        ),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                stops: [
              0.6,
              0.7,
              0.8,
              0.9
            ],
                colors: [
              Colors.grey[100],
              Colors.deepPurpleAccent[100].withOpacity(0.7),
              Colors.deepPurpleAccent[200].withOpacity(0.7),
              Colors.deepPurpleAccent[400].withOpacity(0.9),
            ])),
        child: ListView(children: <Widget>[
          new Padding(
              padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Text("Saúde Mental",
                  style: TextStyle(color: Colors.grey[900], fontSize: 25))),
          new Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 175,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card4.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () async {
                    Navigator.pushNamed(context, "/ansiedade");
                  },
                ),
              ])),
          new Padding(
              padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Text("Atividades Físicas",
                  style: TextStyle(color: Colors.grey[900], fontSize: 25))),
          new Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 175,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card6.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () =>
                      launch("https://www.youtube.com/watch?v=cvhQkEjB--o"),
                ),
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card7.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () =>
                      launch("https://www.youtube.com/watch?v=7Wic5NXeJSk"),
                ),
              ],
            ),
          ),
          new Padding(
              padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Text("Boa Alimentação",
                  style: TextStyle(color: Colors.grey[900], fontSize: 25))),
          new Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 175,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card5.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () => launch(
                      "https://www.minhavida.com.br/alimentacao/materias/11846-18-maneiras-de-seguir-uma-alimentacao-saudavel"),
                ),
              ])),
        ]),
      )),
      //OUTROS ELEMENTOS
    );
  }
}

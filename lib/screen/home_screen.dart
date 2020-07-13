import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          //Insere Logo theGoodBot
          new Image.asset(
            'banner.png',
            height: 100,
          ),
          new Padding(
              padding: new EdgeInsets.only(left: 35, right: 35, top: 10),
              child: Text("Olá, sou o TGB",
                  style: TextStyle(color: Colors.black54, fontSize: 25))),

          //Criação do menu horizontal com imagens clicaveis
          new Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Padding(
                  padding:
                      new EdgeInsets.only(left: 5.0, right: 15.0, bottom: 10.0),
                ),
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card1.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () async {
                    Navigator.pushNamed(context, "/chat");
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(right: 5.0),
                ),
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card2.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () => launch("https://coronavirus.saude.gov.br/"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(right: 5.0),
                ),
                GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      'card3.png',
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 7,
                    margin: EdgeInsets.all(10),
                  ),
                  onTap: () async {
                    Navigator.pushNamed(context, "/saude");
                  },
                ),
              ],
            ),
          ),

          // Botão canto inferior da tela
          new Container(
              height: 70.0,
              margin: new EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  gradient: new LinearGradient(colors: [
                    Colors.indigoAccent[100],
                    Colors.indigoAccent,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          new Padding(
                            padding:
                                new EdgeInsets.only(left: 50.0, right: 50.0),
                          ),
                          ButtonTheme(
                              minWidth: 400.0,
                              height: 70.0,
                              child: new RaisedButton(
                                elevation: 10,
                                textColor: Colors.white,
                                color: Colors.deepPurpleAccent,
                                child: new Text(
                                  "Emergência",
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/emergencia",
                                  );
                                },
                              )),
                        ]))
                  ])),
        ]),
      )),
      //OUTROS ELEMENTOS
    );
  }
}

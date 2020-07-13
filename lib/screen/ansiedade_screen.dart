import 'package:flutter/material.dart';

class AnsiedadeScreen extends StatefulWidget {
  @override
  _AnsiedadeScreenState createState() => _AnsiedadeScreenState();
}

class _AnsiedadeScreenState extends State<AnsiedadeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey[700], //change your color here
          ),
          backgroundColor: Color.fromRGBO(230, 230, 230, 1),
          title: //Insere Logo theGoodBot
              new Image.asset(
            'banner.png',
            height: 60,
          ),
        ),
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        body: Center(
          child: Image.asset(
            'ansioso.gif',
          ),
        ));
  }
}

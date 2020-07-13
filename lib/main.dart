import 'package:flutter/material.dart';
import 'package:the_good_bot/screen/chatbot_screen.dart';
import 'package:the_good_bot/screen/emergencia_screen.dart';
import 'package:the_good_bot/screen/saude_screen.dart';

import 'screen/ansiedade_screen.dart';
import 'screen/contato_novo_screen.dart';
import 'screen/home_screen.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/emergencia': (context) => EmergenciaScreen(),
        '/novo': (context) => ContatosNovoScreen(),
        '/chat': (context) => HomePage(),
        '/saude': (context) => SaudeScreen(),
        '/ansiedade': (context) => AnsiedadeScreen(),
      },
      title: 'The Good Bot',
    );
  }
}
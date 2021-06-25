import 'package:flutter/material.dart';
import 'package:lista_cursos/screens/cursos_detalhes_screen.dart';
import 'package:lista_cursos/screens/cursos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cursos App',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CursosScreen(),
        '/cursos_detalhes': (context) => CursosDetalhesScreen(),
      },
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/

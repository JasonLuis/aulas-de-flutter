import 'package:flutter/material.dart';
import 'package:lista_esportes/screens/esporteOl_detalhes_screen.dart';
import 'package:lista_esportes/screens/esporteOl_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TimesAPP',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(227, 238, 232, 1.0),
        fontFamily: 'Arial',
      ),
      //home: 
      initialRoute: '/',
      routes: {
        '/':(context) => EsportesScreen(),
        '/esporteOl_detalhes_screen': (context) => EsporteDetalhesScreen(),
      },
    );
  }
}




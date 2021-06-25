import 'package:chamada_aluno/screens/editarAluno_screen.dart';
import 'package:chamada_aluno/screens/editarNota_screen.dart';
import 'package:chamada_aluno/screens/listaAluno_screen.dart';
import 'package:chamada_aluno/screens/inserirNota_screen.dart';
import 'package:chamada_aluno/screens/listaNota_screen.dart';
import 'package:chamada_aluno/screens/novoAluno_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chamada",
      theme:ThemeData(
        primaryColor: Color.fromRGBO(227, 238, 232, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => ListaAlunoScreen(),
        '/aluno_novo': (context) => NovoAluno(),
        '/editar_aluno': (context) => EditarAlunoScreen(),
        '/lista_nota': (context) => ListaNotaScreen(),
        '/inserir_nota': (context) => InserirNotaScreen(),
        '/editar_nota': (context) => EditarNotaScreen(),
      },
    );
  }
}

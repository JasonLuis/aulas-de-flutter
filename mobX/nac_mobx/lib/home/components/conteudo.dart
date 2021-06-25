import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nac_mobx/home/components/cabecalho.dart';
import 'package:nac_mobx/home/components/loading.dart';
import 'package:nac_mobx/home/components/title_lista_curso.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';
import 'lista_cursos.dart';

class Conteudo extends StatefulWidget {
  const Conteudo({
    Key key,
  }) : super(key: key);

  @override
  _ConteudoState createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  CursosScreenStore _cursosScreenStore = new CursosScreenStore();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      key: scaffoldKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Cabecalho(
            size: size,
            cursosScreenStore: _cursosScreenStore,
          ),
          TitleListaCurso(title: "Favoritos"),
          Observer(
            builder: (ctx) {
              if (_cursosScreenStore.isLoading) {
                return CursoListViewLoading();
              } else {
                return ListaCursos(
                  cursos: _cursosScreenStore.filtered,
                  cursoStore: _cursosScreenStore,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

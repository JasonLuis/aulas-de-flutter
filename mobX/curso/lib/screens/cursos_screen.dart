import 'package:curso/screens/widget/curso_listview.dart';
import 'package:curso/screens/widget/curso_listview_loading.dart';
import 'package:curso/store/curso_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CursosScreen extends StatefulWidget {
  @override
  _CursosScreenState createState() => _CursosScreenState();
}

class _CursosScreenState extends State<CursosScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //CursoService cursoService = CursoService();
  CursoScreenStore _cursoScreenStore = new CursoScreenStore();

  /*@override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Digite o nome do curso",
          ),
          onChanged: _cursoScreenStore.setFiltro,
        ),
      ),
      body: Observer(builder: (ctx) {
        if (_cursoScreenStore.isLoading) {
          return CursoListViewLoading();
        } else {
          return CursoListView(cursos: _cursoScreenStore.filtered);
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        child: Icon(Icons.cached),
        onPressed: () async {
          _cursoScreenStore.findAllCourses();
        },
      ),
    );
  }
}

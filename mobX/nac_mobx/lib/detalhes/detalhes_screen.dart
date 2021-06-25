import 'package:flutter/material.dart';
import 'package:nac_mobx/detalhes/components/body.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';

class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({
    Key key,
    this.cursosScreenStore,
    this.cursos,
  }) : super(key: key);

  final CursosScreenStore cursosScreenStore;
  final CursosModel cursos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        cursos: cursos,
        cursosScreenStore: cursosScreenStore,
      ),
    );
  }
}

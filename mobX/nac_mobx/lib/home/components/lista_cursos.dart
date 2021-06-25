import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';

import 'cursos_card.dart';

class ListaCursos extends StatelessWidget {
  const ListaCursos({
    Key key,
    @required this.cursos,
    this.cursoStore,
  }) : super(key: key);

  final List<CursosModel> cursos;
  final CursosScreenStore cursoStore;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          cursos.length,
          (int index) {
            return CursosCard(
              cursos: cursos[index],
              cursoStore: cursoStore,
            );
          },
        ),
      ),
    );
  }
}

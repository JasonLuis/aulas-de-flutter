import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nac_mobx/detalhes/detalhes_screen.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';

import '../../constantes.dart';

class CursosCard extends StatelessWidget {
  const CursosCard({
    Key key,
    this.cursos,
    this.cursoStore,
  }) : super(key: key);
  final CursosScreenStore cursoStore;
  final CursosModel cursos;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(cursos.name);
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: cPadding,
          top: cPadding / 2,
          bottom: cPadding * 0.5,
        ),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesScreen(
                      cursosScreenStore: cursoStore,
                      cursos: cursos,
                    ),
                  ),
                );
              },
              child: Image.network(
                cursos.image,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesScreen(
                      cursosScreenStore: cursoStore,
                      cursos: cursos,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(cPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: cPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${cursos.name}\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextSpan(
                            text: "R\$${cursos.preco}".toUpperCase(),
                            style: TextStyle(
                              color: cPrimaryColor.withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

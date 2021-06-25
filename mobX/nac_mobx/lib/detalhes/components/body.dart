import 'package:flutter/material.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';

import '../../constantes.dart';
import 'imagem_e_icones.dart';
import 'titulo_e_preco.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.cursosScreenStore,
    this.cursos,
  }) : super(key: key);

  final CursosScreenStore cursosScreenStore;
  final CursosModel cursos;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImagemIcones(
            size: size,
            image: cursos.image,
          ),
          TituloPreco(
            name: cursos.name,
            conteudo: cursos.conteudo,
            preco: cursos.preco,
          ),
          Row(children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: cPadding),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Text(
                  "${cursos.conteudo}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: cPrimaryColor),
                ),
              ),
            )
          ]),
          SizedBox(height: cPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: cPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "Comprar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    cursosScreenStore.deleteItem(cursos);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Item excluido com sucesso!"),
                    ));
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Excluir",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

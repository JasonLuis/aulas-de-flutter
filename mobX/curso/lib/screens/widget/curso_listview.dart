import 'package:curso/models/curso_model.dart';
import 'package:flutter/material.dart';

import '../../constantes.dart';

class CursoListView extends StatelessWidget {
  const CursoListView({
    Key key,
    @required this.cursos,
  }) : super(key: key);

  final List<CursoModel> cursos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cursos == null ? 0 : cursos.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(cursos[index].id.toString()),
          child: PrincipaisNoticiasCard(
            imagem: "assets/images/image_1.png",
            titulo: "MPSP deflagra Operação Legis Easy cont..",
            subtitulo: "Vereadores e empresários foram presos",
            press: () {},
          ),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Card cardCurso(CursoModel curso) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          onTap: () {},
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
          ),
          title: Text(
            curso.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: (curso.percentualConclusao / 100),
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    curso.nivel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

class PrincipaisNoticiasCard extends StatelessWidget {
  const PrincipaisNoticiasCard({
    Key key,
    this.imagem,
    this.titulo,
    this.subtitulo,
    this.press,
  }) : super(key: key);

  final String imagem, titulo, subtitulo;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: cPadding,
        top: cPadding / 2,
        bottom: cPadding * 2.5,
      ),
      width: 340,
      child: Column(
        children: <Widget>[
          Image.asset(
            imagem,
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(cPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
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
                          text: "$titulo\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$subtitulo".toUpperCase(),
                          style: TextStyle(
                            color: cPrimaryColor.withOpacity(0.5),
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
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constantes.dart';

class TitleListaCurso extends StatelessWidget {
  const TitleListaCurso({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cPadding),
      child: Row(
        children: <Widget>[
          TitleLista(text: title),
          Spacer(),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: cPrimaryColor,
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Função sera implementada no futuro"),
              ));
            },
            child: Text(
              "Mais",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleLista extends StatelessWidget {
  const TitleLista({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: cPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: cPadding / 4),
              height: 7,
              color: cPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}

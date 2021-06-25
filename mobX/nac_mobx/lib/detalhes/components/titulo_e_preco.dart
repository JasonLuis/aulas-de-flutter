import 'package:flutter/material.dart';

import '../../constantes.dart';

class TituloPreco extends StatelessWidget {
  const TituloPreco({
    Key key,
    this.name,
    this.conteudo,
    this.preco,
  }) : super(key: key);

  final String name, conteudo;
  final double preco;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$name\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: cTextoCor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\R\$$preco",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: cPrimaryColor),
          ),
        ],
      ),
    );
  }
}

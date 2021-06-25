import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nac_mobx/store/cursos_screen_store.dart';

import '../../constantes.dart';

class Cabecalho extends StatelessWidget {
  const Cabecalho({
    Key key,
    @required this.size,
    @required this.cursosScreenStore,
  }) : super(key: key);

  final Size size;
  final CursosScreenStore cursosScreenStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: cPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: cPadding,
              right: cPadding,
              bottom: 36 + cPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: cPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Bem vindo ao Cursos Dev!',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/dev.png",
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: cPadding),
                padding: EdgeInsets.symmetric(horizontal: cPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: cPrimaryColor.withOpacity(0.23),
                    )
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: cPrimaryColor.withOpacity(1),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: cursosScreenStore.setFiltro,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

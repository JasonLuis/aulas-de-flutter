import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../constantes.dart';

class Cabecalho extends StatefulWidget {
  Cabecalho({
    Key key,
    @required this.size,
    @required this.dsrptScreenStore,
  }) : super(key: key);

  final Size size;
  final DsrptScreenStore dsrptScreenStore;

  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: cPadding * 2.5),
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: cPadding,
              right: cPadding,
              bottom: 36 + cPadding,
            ),
            height: widget.size.height * 0.2 - 27,
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
                  'Welcome DSROT!',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                Image.asset("assets/image/bot.png"),
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
                            color: cPrimaryColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: widget.dsrptScreenStore.setFiltro,
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

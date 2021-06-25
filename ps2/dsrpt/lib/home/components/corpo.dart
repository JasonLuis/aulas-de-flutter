import 'package:dsrpt/home/components/cabecalho.dart';
import 'package:dsrpt/home/components/card_robot.dart';
import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'loading.dart';

class Corpo extends StatefulWidget {
  const Corpo({Key key, this.dsrptScreenStore}) : super(key: key);

  @override
  _CorpoState createState() => _CorpoState();

  final DsrptScreenStore dsrptScreenStore;
}

class _CorpoState extends State<Corpo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Cabecalho(
            dsrptScreenStore: widget.dsrptScreenStore,
            size: size,
          ),
          Observer(
            builder: (ctx) {
              if (widget.dsrptScreenStore.isLoading) {
                return Loading();
              } else {
                return CardRobot(
                  key: widget.key,
                  robot: widget.dsrptScreenStore.filtered,
                  dsrptScreenStore: widget.dsrptScreenStore,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

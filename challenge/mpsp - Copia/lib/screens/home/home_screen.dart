import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/store/news_screen_store.dart';

import 'components/corpo.dart';
import 'components/rodape.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  NewsScreenStore newsScreenStore = new NewsScreenStore();

  UsuarioModel usuario;

  @override
  Widget build(BuildContext context) {
    usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(context),
      body: Corpo(
        usuario: usuario,
        newsScreenStore: newsScreenStore,
      ),
      bottomNavigationBar: Rodape(
        usuario: usuario,
        newsScreenStore: newsScreenStore,
      ),
    );
  }
}

//Barra do app
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/log-out.svg"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

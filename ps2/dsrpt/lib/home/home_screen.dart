import 'package:dsrpt/constantes.dart';
import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/corpo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DsrptScreenStore dsrptScreenStore = new DsrptScreenStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(context),
      body: Corpo(
        key: scaffoldKey,
        dsrptScreenStore: dsrptScreenStore,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: cPrimaryColor,
        ),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(
            context,
            "/cadastrar",
            arguments: dsrptScreenStore,
          );
          if (retorno != null) {
            setState(() {});
            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(retorno),
              ),
            );
          }
        },
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/exit.svg"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

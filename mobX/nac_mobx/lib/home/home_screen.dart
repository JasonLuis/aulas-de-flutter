import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nac_mobx/home/components/conteudo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Conteudo(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }
}

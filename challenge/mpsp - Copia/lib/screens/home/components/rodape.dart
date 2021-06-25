import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/screens/chat/kommunicate_flutter_plugin.dart';
import 'package:mpsp/screens/editar/update_screen.dart';
import 'package:mpsp/store/news_screen_store.dart';

import '../../../constantes.dart';

class Rodape extends StatelessWidget {
  const Rodape({
    Key key,
    this.usuario,
    this.newsScreenStore,
  }) : super(key: key);

  final UsuarioModel usuario;
  final NewsScreenStore newsScreenStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: cPadding * 2,
        right: cPadding * 2,
        bottom: cPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: cPrimaryColor.withOpacity(0.38),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/home-run.svg"),
            onPressed: () {
              Navigator.pushNamed(context, '/homePage',
                  arguments: UsuarioModel.usuarioModel);
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/message.svg"),
            onPressed: () {
              KommunicateFlutterPlugin.loginAsVisitor("APP_ID").then((result) {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
                print("Login as visitor successful : " + result.toString());
              }).catchError((error) {
                print("Login as visitor failed : " + error.toString());
              });
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpadateLogin(
                    newsScreenStore: newsScreenStore,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

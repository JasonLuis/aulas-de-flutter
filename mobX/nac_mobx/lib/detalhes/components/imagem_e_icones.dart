import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nac_mobx/detalhes/components/icones_card.dart';
import '../../constantes.dart';

class ImagemIcones extends StatelessWidget {
  const ImagemIcones({Key key, @required this.size, @required this.image})
      : super(key: key);

  final Size size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: cPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: cPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: cPadding),
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconesCard(
                      icon: "assets/icons/marcador.svg",
                      press: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Função sera implementada no futuro"),
                        ));
                      },
                    ),
                    IconesCard(
                      icon: "assets/icons/excluir.svg",
                      press: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Função sera implementada no futuro"),
                        ));
                      },
                    ),
                    IconesCard(
                      icon: "assets/icons/lupa.svg",
                      press: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Função sera implementada no futuro"),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: cPrimaryColor.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

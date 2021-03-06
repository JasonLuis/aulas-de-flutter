import 'package:flutter/material.dart';
import '../../../constantes.dart';

class InfoNovidades extends StatelessWidget {
  const InfoNovidades({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InfoNovidadesCard(
            imagem: "assets/images/info_img_1.png",
            press: () {},
          ),
          InfoNovidadesCard(
            imagem: "assets/images/info_img_2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class InfoNovidadesCard extends StatelessWidget {
  const InfoNovidadesCard({
    Key key,
    this.imagem,
    this.press,
  }) : super(key: key);

  final String imagem;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: cPadding,
          top: cPadding / 2,
          bottom: cPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagem),
          ),
        ),
      ),
    );
  }
}

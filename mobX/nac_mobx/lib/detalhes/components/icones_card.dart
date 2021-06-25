import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constantes.dart';

class IconesCard extends StatelessWidget {
  const IconesCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
        padding: EdgeInsets.all(cPadding / 2),
        height: 62,
        width: 62,
        decoration: BoxDecoration(
          color: cBackgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: cPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

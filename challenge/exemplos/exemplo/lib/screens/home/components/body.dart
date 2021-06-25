import 'package:exemplo/constants.dart';
import 'package:exemplo/screens/home/components/recomend_plants.dart';
import 'package:exemplo/screens/home/components/title_with_searchbox.dart';
import 'package:flutter/material.dart';

import 'featured_plants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrooling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Noticias", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Principais", press: () {}),
          FeaturedPlants(),
          SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}

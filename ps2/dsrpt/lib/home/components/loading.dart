import 'package:dsrpt/constantes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List<Widget>.generate(
          6,
          (int index) {
            return DsrptCard();
          },
        ),
      ),
    );
  }
}

class DsrptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cPrimaryColor,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Shimmer.fromColors(
              highlightColor: cPrimaryColor,
              baseColor: Colors.white,
              period: Duration(milliseconds: 4000),
              enabled: false,
              child: Icon(Icons.autorenew),
            ),
          ),
          title: Shimmer.fromColors(
            highlightColor: cPrimaryColor,
            baseColor: Colors.white,
            period: Duration(milliseconds: 4000),
            child: Container(
              height: 18,
              width: 40,
              color: cPrimaryColor,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Shimmer.fromColors(
                    highlightColor: cPrimaryColor,
                    baseColor: Colors.white,
                    child: LinearProgressIndicator(
                      backgroundColor: cPrimaryColor,
                      value: (100),
                      valueColor: AlwaysStoppedAnimation(cPrimaryColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Shimmer.fromColors(
                    highlightColor: cPrimaryColor,
                    baseColor: Colors.white,
                    period: Duration(milliseconds: 4000),
                    child: Container(
                      height: 18,
                      width: 40,
                      color: cPrimaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

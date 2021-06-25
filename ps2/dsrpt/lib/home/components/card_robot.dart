import 'package:dsrpt/create_update/update.dart';
import 'package:dsrpt/models/robot_model.dart';
import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/material.dart';

import '../../constantes.dart';

class CardRobot extends StatefulWidget {
  const CardRobot({
    Key key,
    @required this.robot,
    @required this.dsrptScreenStore,
  }) : super(key: key);

  @override
  _CardRobotState createState() => _CardRobotState();

  final List<RobotModel> robot;
  final DsrptScreenStore dsrptScreenStore;
}

class _CardRobotState extends State<CardRobot> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List<Widget>.generate(
          widget.robot.length,
          (int index) {
            return Dismissible(
              key: Key(widget.robot[index].id.toString()),
              child: DsrptCard(
                robot: widget.robot[index],
                press: () async {
                  var retorno = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateBot(
                        dsrptScreenStore: widget.dsrptScreenStore,
                        robot: widget.robot[index],
                      ),
                    ),
                  );
                },
              ),
              direction: DismissDirection.endToStart,
              background: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDismissed: (direction) {
                widget.dsrptScreenStore.deleteItem(widget.robot[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class DsrptCard extends StatelessWidget {
  const DsrptCard({
    Key key,
    this.robot,
    this.press,
  }) : super(key: key);

  final RobotModel robot;
  final Function press;

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
          onTap: press,
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
            child: Image.asset(
              "assets/image/robo.png",
            ),
          ),
          title: Text(
            robot.nome,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Quantidade: " + robot.quantidade.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          //trailing: SvgPicture.asset("assets/icons/robo.svg"),
        ),
      ),
    );
  }
}

import 'package:dsrpt/constantes.dart';
import 'package:dsrpt/models/robot_model.dart';
import 'package:dsrpt/service/dsrpt_service.dart';
import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateBot extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RobotModel robot = new RobotModel();
  DsrptScreenStore dsrptScreenStore;
  @override
  Widget build(BuildContext context) {
    dsrptScreenStore = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastrar Robo"),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: Form(
          key: formKey,
          child: Center(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome do Robo",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Digite o nome do Robo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    robot.nome = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Informe a quantidade em estoque",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe a quantidade';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    robot.quantidade = int.parse(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 8,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Informe o esquema Mecânico",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o esquema Mecânico';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    robot.esqMecanico = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          dsrptScreenStore.createItem(robot);
                          var mensagem =
                              robot.nome + ' cadastrado com sucesso!';

                          Navigator.pop(
                            context,
                            mensagem,
                          );
                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível realizar o cadastro',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text(
                      "Cancelar",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dsrpt/constantes.dart';
import 'package:dsrpt/models/robot_model.dart';
import 'package:dsrpt/store/dsrpt_screen_store.dart';
import 'package:flutter/material.dart';

class UpdateBot extends StatefulWidget {
  const UpdateBot({Key key, this.dsrptScreenStore, this.robot})
      : super(key: key);

  @override
  _UpdateBotState createState() => _UpdateBotState();
  final DsrptScreenStore dsrptScreenStore;
  final RobotModel robot;
}

class _UpdateBotState extends State<UpdateBot> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RobotModel robot = new RobotModel();

  @override
  Widget build(BuildContext context) {
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
                  initialValue: widget.robot.nome,
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
                  initialValue: widget.robot.quantidade.toString(),
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
                  initialValue: widget.robot.esqMecanico,
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
                          robot.id = widget.robot.id;
                          widget.dsrptScreenStore.updateItem(robot);
                          var mensagem = robot.nome + 'editado com sucesso!';

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

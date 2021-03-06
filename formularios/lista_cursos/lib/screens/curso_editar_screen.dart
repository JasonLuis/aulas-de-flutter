import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_cursos/models/curso_model.dart';
import 'package:lista_cursos/repository/curso_repository.dart';

class CursosEditarScreen extends StatefulWidget {
  @override
  _CursosEditarScreenState createState() => _CursosEditarScreenState();
}

class _CursosEditarScreenState extends State<CursosEditarScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CursoModel cursoModel = new CursoModel();

  @override
  Widget build(BuildContext context) {
    cursoModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Editar Curso"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: cursoModel.nome,
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite o nome do curso',
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o nome do curso';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      cursoModel.nome = value;
                    },
                  ),
                  TextFormField(
                    initialValue: cursoModel.preco.toString(),
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.monetization_on),
                      hintText: '999',
                      labelText: 'Pre??o',
                    ),
                    validator: (value) {
                      if ((value.isEmpty) || (int.parse(value) <= 0)) {
                        return 'Digite um pre??o v??lido!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      cursoModel.preco = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    initialValue: cursoModel.percentualConclusao.toString(),
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.flight_takeoff),
                      hintText: '99.99',
                      labelText: 'Percentual de conclus??o',
                    ),
                    validator: (value) {
                      if ((value.isEmpty) || (double.parse(value) <= 0)) {
                        return 'Digite um percentual correto!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var percent = double.parse(value);
                      cursoModel.percentualConclusao = percent / 100;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    initialValue: cursoModel.conteudo,
                    maxLines: 5,
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.description),
                      hintText: 'Conte??do para o curso',
                      labelText: 'Conte??do',
                    ),
                    validator: (value) {
                      if ((value.isEmpty)) {
                        return 'Digite o conte??do do curso!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      cursoModel.conteudo = value;
                    },
                    keyboardType: TextInputType.multiline,
                  ),
                  DropdownButtonFormField<String>(
                    value: cursoModel.nivel,
                    items:
                        ["B??sico", "Intermedi??rio", "Avan??ado", "Especializado"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.score),
                      hintText: 'Selecione o n??vel',
                      labelText: 'N??vel',
                    ),
                    validator: (value) {
                      if ((value == null)) {
                        return 'Selecione o n??vel do curso!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      cursoModel.nivel = value;
                    },
                    onChanged: (value) {
                      cursoModel.nivel = value;
                    },
                  ),

                  
                  



                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Gravar"),
                      onPressed: () {

                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          CursoRepository().update(cursoModel);

                          var mensagem = cursoModel.nome + ' editado com sucesso!'; 

                          Navigator.pop(
                            context,
                            mensagem,
                          );

                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'N??o foi poss??vel gravar o curso.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

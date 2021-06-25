import 'package:chamada_aluno/model/aluno_model.dart';
import 'package:chamada_aluno/repository/aluno_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditarAlunoScreen extends StatefulWidget{
  @override
  _NovoAlunoState createState() => _NovoAlunoState();  
}
AlunoModel alunoModel = new AlunoModel();

class _NovoAlunoState extends State<EditarAlunoScreen>{
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    alunoModel = ModalRoute.of(context).settings.arguments;
    int rm = alunoModel.rm;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233,28,93,1),
        title: Text("Cadastro de Alunos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
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
                   initialValue: alunoModel.nome,
                   decoration: new InputDecoration(
                     icon: const Icon(Icons.people),
                     hintText: 'Digite o nome do aluno',
                     labelText: 'Nome',
                   ),
                   validator: (value) {
                     if (value.isEmpty) {
                       return 'Digite o nome do curso';
                     }
                     return null;
                   },
                   onSaved: (value) {
                     alunoModel.nome = value;
                   },
                 ),
                 TextFormField(
                   initialValue: alunoModel.rm.toString(),
                   decoration: new InputDecoration(
                     icon: const Icon(Icons.payment),
                     hintText: 'RM do aluno',
                     labelText: 'RMXXXXX',
                   ),
                   validator: (value) {
                     if (value.isEmpty) {
                       return 'Digite o RM do aluno';
                     }
                     return null;
                   },
                   onSaved: (value) {
                     alunoModel.rm = int.parse(value);
                   },
                 ),
                 DropdownButtonFormField<String>(
                    value: alunoModel.presenca,
                    items:
                        ["Presente", "Falta"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.perm_contact_calendar),
                      hintText: 'Informe o status do aluno',
                      labelText: 'Status',
                    ),
                    validator: (value) {
                      if ((value == null)) {
                        return 'Informe o status do aluno';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.presenca = value;
                    },
                    onChanged: (value) {
                      setState(() {
                        alunoModel.presenca = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:ButtonTheme(
                      minWidth:500,
                      height:40.0,
                      child: RaisedButton(
                        color: Color.fromRGBO(233,28,93,1),
                        child: Text("Salvar",
                        style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {

                          if(formKey.currentState.validate()) {
                            formKey.currentState.save();
                            AlunoRepository().update(alunoModel,rm);
                            var mensagem = alunoModel.nome + ' cadastrado com sucesso!'; 

                            Navigator.pop(
                              context,
                              mensagem,
                            );

                          }else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Não foi possível cadastrar o novo aluno',
                                ),
                              ),
                            );
                          }
                        },
                        
                    ),),
                  ), 
               ],
              ),
            ),
          ),
        )
      )
    );
  }
  
  
}
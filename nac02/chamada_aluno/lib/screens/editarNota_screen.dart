import 'package:chamada_aluno/model/notaAluno_model.dart';
import 'package:chamada_aluno/repository/notaAluno_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditarNotaScreen extends StatefulWidget{
  @override
  _EditarNotaScreen createState() => _EditarNotaScreen();
}
  NotaAlunoModel notaAlunoModel = new NotaAlunoModel();

  class _EditarNotaScreen extends State<EditarNotaScreen>{
    final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      notaAlunoModel = ModalRoute.of(context).settings.arguments;
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(233,28,93,1),
        title: Text(
          'Inserir Nota',
          style: TextStyle(
              color: Colors.white
            ),),
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
                   initialValue: notaAlunoModel.rm.toString(),
                   decoration: new InputDecoration(
                     icon: const Icon(Icons.people),
                     hintText: 'Digite o RM do aluno',
                     labelText: 'RM',
                   ),
                   validator: (value) {
                     if (value.isEmpty) {
                       return 'Digite o RM do aluno';
                     }
                     return null;
                   },
                   onSaved: (value) {
                     notaAlunoModel.rm = int.parse(value);
                   },
                 ),
                 TextFormField(
                   initialValue: notaAlunoModel.nota.toString(),
                   decoration: new InputDecoration(
                     icon: const Icon(Icons.people),
                     hintText: 'Digite a nota do aluno',
                     labelText: 'Nota',
                   ),
                   validator: (value) {
                     if (value.isEmpty) {
                       return 'Digite a nota do aluno';
                     }
                     return null;
                   },
                   onSaved: (value) {
                     notaAlunoModel.nota = double.parse(value);
                   },
                 ),
                 Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ButtonTheme(
                      minWidth:500,
                      height:40.0,
                      child:RaisedButton(
                          color: Color.fromRGBO(233,28,93,1),
                          child: Text("Salvar",
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 20,
                            ),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                          if(formKey.currentState.validate()) {
                            formKey.currentState.save();
                            NotaAlunoRepository().update(notaAlunoModel);
                            //print("Algo: "+notaAlunoModel.rm.toString());
                            var mensagem = 'Nota cadastrado com sucesso!'; 
                            Navigator.pop(  
                              context,
                              mensagem,
                            );
                          }else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível inserir a nota',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    ),)
                ]
              ),
            ),
          ),           
        ),
        ),
      );
    }

}
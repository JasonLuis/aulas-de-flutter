import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/curso_model.dart';

class CursosDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CursoModel cursoModel =
    ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Nome do Curso"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('ID'),
            fieldValue(cursoModel.id.toString()),
            espaco(),
            labelValue('Nível'),
            fieldValue(cursoModel.nivel.toString()),
            espaco(),
            labelValue('Preço'),
            fieldValue(cursoModel.preco.toString()),
            espaco(),
            labelValue('% Conclusão'),
            fieldValue((cursoModel.percentualConclusao*100).toString()+"%"),
            espaco(),
            labelValue('Conteúdo'),
            fieldValue('Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.'),
            espaco(),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Tenho Interesse!"),
              )
             
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        onPressed: (){
          //Navegar para tela de detalhes
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox espaco() => SizedBox(height: 16,);

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, 1),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}

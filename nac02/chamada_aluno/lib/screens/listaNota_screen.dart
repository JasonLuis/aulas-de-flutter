import 'package:chamada_aluno/model/notaAluno_model.dart';
import 'package:chamada_aluno/repository/notaAluno_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaNotaScreen extends StatefulWidget{

  @override
  _ListaNotaScreen createState() => _ListaNotaScreen();

}


class _ListaNotaScreen extends State<ListaNotaScreen>{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233,28,93,1),
        title: Text(
          'Lista de Notas',
          style: TextStyle(
              color: Colors.white
            ),),
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body: FutureBuilder<List<NotaAlunoModel>>(
        future: NotaAlunoRepository().findAll(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return buildListView(snapshot.data);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer( 
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: new AssetImage("fiap.jpg"),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(233,28,93,1),
              ),
            ),
            ListTile(
              title: Text('Lista de Alunos'),
              onTap: () async {
                var retorno = await Navigator.pushNamed(context, "/");
                if (retorno != null) {
                  setState(() {});
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(retorno),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text('Lista de Nota'),
              onTap: () async {
                var retorno = await Navigator.pushNamed(context, "/lista_nota");
                if (retorno != null) {
                  setState(() {});
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(retorno),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(233,28,93,1),
        child: Icon(Icons.add),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(context, "/inserir_nota");

          if (retorno != null) {
            setState(() {});
            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(retorno),
              ),
            );
          }
        },
      ),
    );
  }
  
  ListView buildListView(List<NotaAlunoModel> notas){
    return ListView.builder(  
      itemCount: notas == null ? 0: notas.length,
      itemBuilder: (BuildContext ctx, int index){
        return Dismissible(
          key: Key(notas[index].rm.toString()),
          child: cardTimes(notas[index]),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
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
            NotaAlunoRepository().delete(notas[index]);
            setState(() {});
          },
        );
      }
    );
  }

  Card cardTimes(NotaAlunoModel notas){

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(228, 229, 228, 0.2)
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
            child: Icon(
               Icons.create,
               size: 50,
               color: Colors.black,
            ),
          ),
          title: Text(
            notas.rm.toString(),
            style: TextStyle(
              color: Color.fromRGBO(49, 53, 64, 1.0)
            ),
          ),
          trailing: Text(
            notas.nota.toString(),
            style: TextStyle(
              color: Color.fromRGBO(49, 53, 64, 1.0),
              fontSize: 20,
            ),
          ),
          onTap: () async{
            //Chamar tela de inserir nota
            var retorno = await Navigator.pushNamed(context, "/editar_nota",arguments:notas);
                if (retorno != null) {
                  setState(() {});
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(retorno),
                    ),
                  );
                }
          }
        ),
      ),
    );
  }
}

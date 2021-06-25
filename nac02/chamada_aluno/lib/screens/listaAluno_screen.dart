import 'package:chamada_aluno/model/aluno_model.dart';
import 'package:chamada_aluno/repository/aluno_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaAlunoScreen extends StatefulWidget{
  @override
  _ListaAlunoState createState() => _ListaAlunoState();
} 

class _ListaAlunoState extends State<ListaAlunoScreen>{
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233,28,93,1),
        title: Text(
          'Chamada',
          style: TextStyle(
              color: Colors.white
          ),),
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body: FutureBuilder<List<AlunoModel>>(
        future: AlunoRepository().findAll(),
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
          var retorno = await Navigator.pushNamed(context, "/aluno_novo");

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
  ListView buildListView(List<AlunoModel> alunos){
    return ListView.builder(  
      itemCount: alunos == null ? 0: alunos.length,
      itemBuilder: (BuildContext ctx, int index){
        return Dismissible(
          key: Key(alunos[index].rm.toString()),
          child: cardTimes(alunos[index]),
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
            AlunoRepository().delete(alunos[index]);
            setState(() {});
          },
        );
      }
    );
  }

  Card cardTimes(AlunoModel aluno){
    var icon = Icons.done;
    var cor = Colors.green;
    if(aluno.presenca == "Falta"){
      icon = Icons.clear;
      cor = Colors.red;
    }
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
               Icons.people,   
               size: 50,
               color: Colors.black,
            ),
          ),
          title: Text(
            aluno.nome,
            style: TextStyle(
              color: Color.fromRGBO(49, 53, 64, 1.0)
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    aluno.rm.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(49, 53, 64, 1.0)
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            icon,
            color: cor,
            size: 30.0,
          ),
          onTap: () {
            editarAluno(context, aluno);
          }
        ),
      ),
    );
  }
  editarAluno(ctx, aluno) async {
    final retorno = await Navigator.pushNamed(
      ctx,
      "/editar_aluno",
      arguments: aluno,
    );

    AlunoModel alunoModel = retorno as AlunoModel;     
  }
}
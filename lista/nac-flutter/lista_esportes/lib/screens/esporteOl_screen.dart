import 'package:flutter/material.dart';
import 'package:lista_esportes/model/esporteOl_model.dart';
import 'package:lista_esportes/repository/esporteOl_repository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EsportesScreen extends StatefulWidget{
  @override
  _EsportesScreenState createState() => _EsportesScreenState();
}
  
class _EsportesScreenState extends State<EsportesScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 169, 90, 1.0),
        title: Text(
          'Esportes Olímpicos',
          style: TextStyle(
              color: Colors.white
            ),),
      ),
      body: FutureBuilder<List<EsporteModel>>(
        future: EsportesRepository().findAllAsync(),
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
    );
  }

  ListView buildListView(List<EsporteModel> esportes){
    return ListView.builder(  
      itemCount: esportes == null ? 0: esportes.length,
      itemBuilder: (BuildContext ctx, int index){
        return cardTimes(esportes[index]);
      }
    );
  }

  Card cardTimes(EsporteModel esportes){
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
               esportes.esporte,
               size: 50,
               color: Colors.green,
            ),
          ),
          title: Text(
            esportes.nome,
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
                    "Criado em "+esportes.dtCriacao.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(49, 53, 64, 1.0)
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30.0,
          ),
          onTap: () {

            Navigator.pushNamed(
              context,
              "/esporteOl_detalhes_screen",
              arguments: esportes,
            );
          }
        ),
      ),
    );
  }
}


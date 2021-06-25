
import 'package:flutter/material.dart';
import 'package:lista_esportes/model/esporteOl_model.dart';

class EsporteDetalhesScreen extends StatelessWidget{
  EsporteModel esporteModel;
  
  @override
  Widget build(BuildContext context) {
    esporteModel =  ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          esporteModel.esporte,
          color: Colors.white,
          size: 60.0
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          esporteModel.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 22.7),
        
      ],
    );
    
    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(esporteModel.img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(60, 60, 60, 0.5)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
          ),
        )
      ],
    );

    final bottomTextHistoria = Text(
      esporteModel.historia,
      style: TextStyle(fontSize: 17.0),
      textAlign: TextAlign.justify,
    );

    final backButton = Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () => {
          Navigator.pop(context)
        },
        color: Color.fromRGBO(21, 169, 90, 1.0),
        child: Text(
          "Voltar ao Menu Principal!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          bottomTextHistoria,
          backButton,
        ]
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }

}
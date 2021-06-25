import 'package:flutter/widgets.dart';

class EsporteModel {
  int id;
  String nome;
  String historia;
  String dtCriacao;
  String pais;
  String img;
  IconData esporte;

  EsporteModel({
    this.id,
    this.nome,  
    this.historia,
    this.dtCriacao,
    this.pais,
    this.img,
    this.esporte,
  });
}
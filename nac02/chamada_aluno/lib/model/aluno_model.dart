import 'dart:convert';

class AlunoModel{

  String nome;
  int rm;
  String presenca;

  AlunoModel({
    this.nome,
    this.rm,
    this.presenca,
  });

  factory AlunoModel.fromJson(String str) => AlunoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        nome: json["nome"],
        rm: json["rm"],
        presenca: json["presenca"],
    );

    Map<String, dynamic> toMap() => {
        "nome": nome,
        "rm": rm,
        "presenca": presenca,
    };

}
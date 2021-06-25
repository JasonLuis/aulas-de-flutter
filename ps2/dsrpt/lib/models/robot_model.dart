import 'dart:convert';

class RobotModel {
  int id;
  String nome;
  int quantidade;
  String esqMecanico;

  RobotModel({
    this.id,
    this.nome,
    this.quantidade,
    this.esqMecanico,
  });

  factory RobotModel.fromJson(String str) =>
      RobotModel.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RobotModel.fromMap(Map<String, dynamic> json) => RobotModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        nome: json["nome"],
        quantidade: (json["quantidade"] is int)
            ? json["quantidade"]
            : int.parse(json["quantidade"]),
        esqMecanico: json["esqMecanico"],
      );
  Map<String, dynamic> toMap() => {
        "nome": nome,
        "quantidade": quantidade,
        "esqMecanico": esqMecanico,
      };
}

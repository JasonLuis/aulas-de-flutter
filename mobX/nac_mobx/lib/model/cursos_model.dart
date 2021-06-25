import 'dart:convert';

class CursosModel {
  int id;
  String name;
  String conteudo;
  double preco;
  String image;

  CursosModel({
    this.id,
    this.name,
    this.conteudo,
    this.preco,
    this.image,
  });

  factory CursosModel.fromJson(String str) =>
      CursosModel.fromMap(json.decode(str));

  factory CursosModel.fromMap(Map<String, dynamic> json) => CursosModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        name: json["name"],
        conteudo: json["conteudo"],
        preco: json["preco"].toDouble(),
        image: json["image"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "conteudo": conteudo,
        "preco": preco,
        "image": image,
      };
}

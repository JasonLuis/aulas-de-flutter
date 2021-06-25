
import 'dart:convert';

class NotaAlunoModel {
    NotaAlunoModel({
        this.id,
        this.rm,
        this.nota,
    });

    int id;
    int rm;
    double nota;

    factory NotaAlunoModel.fromJson(String str) => NotaAlunoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NotaAlunoModel.fromMap(Map<String, dynamic> json) => NotaAlunoModel(
        id: json["id"],
        rm: json["rm"],
        nota: json["nota"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "rm": rm,
        "nota": nota,
    };
}

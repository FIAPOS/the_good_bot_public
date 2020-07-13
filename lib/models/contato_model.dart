import 'dart:convert';

class ContatoModel {
  int id;
  String nome;
  String telefone;

  ContatoModel({
    this.id,
    this.nome,
    this.telefone,
  });

  factory ContatoModel.fromJson(String str) =>
      ContatoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContatoModel.fromMap(Map<String, dynamic> json) => ContatoModel(
        id: json["id"],
        nome: json["nome"],
        telefone: json["telefone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "telefone": telefone,
      };
}
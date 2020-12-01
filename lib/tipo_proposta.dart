import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TipoProposta {
  int id;
   String nome;

  TipoProposta({
    @required this.id,
    @required this.nome});

  factory TipoProposta.fromJson(Map<String, dynamic> json) {
    return TipoProposta(
      id: json['id'],
      nome: json['nome'],
    );
  }

  @override
  String toString() {
    return 'Tipo proposta: ${this.nome}';
  }
}
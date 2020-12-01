import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Instituicao {
  int id;
  String nome;
   int tipo;

  Instituicao({
    @required this.id,
  @required this.nome,
  @required this.tipo});

  Instituicao.fromJson(Map<String, dynamic> json) {

      id = json['id']as int;
      nome = json['nome']as String;
      tipo =json['tipo'] as int;
      List<int> bytes =  nome.toString().codeUnits;
      nome = utf8.decode(bytes);

  }

}
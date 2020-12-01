import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Nota {
  String titulo;
  bool desclassificavel;
  int pontos;
  int id;

  Nota({
    @required this.desclassificavel,
    @required this.id,
    @required this.pontos,
    @required this.titulo
  });

  Nota.fromJson(Map<String, dynamic> json) {
    desclassificavel =  json['desclassificavel'] as bool;
    id =  json['id'] as int;
    pontos =  json['pontos'] as int;
   titulo =  json['titulo'] as String;
    List<int> bytes =  titulo.toString().codeUnits;
    titulo = utf8.decode(bytes);
  }
}
import 'package:flutter/cupertino.dart';

class SubPdc {
  int id;
  int numero;
  String titulo;

  SubPdc({@required this.id, @required this.numero, @required this.titulo});

   SubPdc.fromJson(Map<String, dynamic> json) {

        id = json['id'] as int;
        numero = json['numero'] as int;
        titulo = json['titulo'] as String;

  }

}
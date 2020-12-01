
  import 'package:flutter/cupertino.dart';

class PerfilAcesso {
  int id;
  String nome;

  PerfilAcesso({
    @required this.id,
    @required this.nome});

  PerfilAcesso.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  nome = json['nome'];
  }


  }

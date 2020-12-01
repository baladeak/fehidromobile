import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Usuario {
  bool ativo;
  String celular;
  String cpf;
  String email;
  int id;
  String login;
  String nome;
  int perfilAcesso;
 // String senha;
  String sobrenome;

  Usuario(
      {@required this.ativo,
  @required this.celular,
  @required this.cpf,
  @required this.email,
  @required this.id,
  @required this.login,
  @required this.nome,
  @required this.perfilAcesso,
    //        this.senha,
  @required  this.sobrenome});

  Usuario.fromJson(Map<String, dynamic> json) {
    ativo = json['ativo'] as bool;
    celular = json['celular'] as String;
    cpf = json['cpf'] as String;
    email = json['email'] as String;
    id = json['id'] as int;
    login = json['login'] as String;
    nome = json['nome'] as String;
    perfilAcesso = json['perfilAcesso'] as int;
   // senha = json['senha'];
    sobrenome = json['sobrenome'] as String;
  }
}

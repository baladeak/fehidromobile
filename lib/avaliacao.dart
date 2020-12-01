
import 'package:flutter/material.dart';
import 'dart:convert';
import 'Nota.dart';
import 'SubCriterio.dart';
import 'Usuario.dart';
import 'proposta.dart';
import 'tipo_proposta.dart';

class Avaliacao {

  Usuario avaliador;

  int id;

  Nota nota;

  Proposta proposta;
  Subcriterio subcriterio;

  Avaliacao(
      {
   @required this.avaliador,
   @required this.id,
   @required this.nota,
   @required this.proposta,
   @required this.subcriterio
  });

     Avaliacao.fromJson(Map<String, dynamic> json) {

     avaliador = Usuario.fromJson(json['avaliador']);
    id = json['id']as int;
    nota = json['nota'] != null ? new Nota.fromJson(json['nota']) : null;
    proposta = Proposta.fromJson(json['proposta']);
    subcriterio = Subcriterio.fromJson(json['subcriterio']);

  }
}

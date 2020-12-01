import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:teste_api/subpdc.dart';
import 'package:teste_api/tipo_proposta.dart';

import 'instituicao.dart';

class Proposta {
  int id;
  String nomeProjeto;
   Instituicao instituicao;
   SubPdc subPdc;
 List<TipoProposta> tiposProposta;

  Proposta(
      {
        @required this.id,
        @required this.nomeProjeto,
       @required this.instituicao,
       @required this.subPdc,
       @required this.tiposProposta
   });

      Proposta.fromJson(Map<String, dynamic> json) {
       var tiposProposta = (json['tiposProposta'])
          .map<TipoProposta>((item) => TipoProposta.fromJson(item))
          .toList();


        id = json['id'] as int;
        nomeProjeto = json['nomeProjeto'] as String;
       instituicao = Instituicao.fromJson(json['instituicao']) != null ? new Instituicao.fromJson(json['instituicao']) : null;
     List<int> bytes =  nomeProjeto.toString().codeUnits;
      nomeProjeto = utf8.decode(bytes);
        subPdc = SubPdc.fromJson(json['subPDC']);
       this.tiposProposta = tiposProposta;
  }

}

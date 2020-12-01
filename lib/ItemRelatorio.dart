import 'package:flutter/material.dart';
import 'package:teste_api/avaliacao.dart';
import 'package:teste_api/proposta.dart';

class ItensRelatorio {
   Proposta proposta;
  int soma;
  // List<Avaliacao> avaliacoes;
  //int classificacaoSubpdc;
  // int classificacao;
  // bool desclassificado;
  //String stringDesclassificado;

  ItensRelatorio({
     @required this.proposta,
    @required this.soma,
    // @required this.avaliacoes,
    // @required this.classificacaoSubpdc,
    // @required this.classificacao,
    //  @required this.desclassificado,
    // @required this.stringDesclassificado
  });

  ItensRelatorio.fromJson(Map<String, dynamic> json) {

    proposta = json['proposta'] != null
        ? new Proposta.fromJson(json['proposta'])
        : null;


    soma = json['soma'] as int;
    /*
    if (json['avaliacoes'] != null) {
      avaliacoes = new List<Avaliacao>();
      json['avaliacoes'].forEach((v) {
        avaliacoes.add(new Avaliacao.fromJson(v));
      });
    }
    classificacaoSubpdc = json['classificacaoSubpdc'] as int;
    classificacao = json['classificacao'] as int;
    desclassificado = json['desclassificado'] as bool;
    stringDesclassificado = json['stringDesclassificado'] as String;
    */
  }
}

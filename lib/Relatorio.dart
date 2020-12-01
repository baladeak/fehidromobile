import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:teste_api/ItemRelatorio.dart';

class Relatorio {
  List<ItensRelatorio> itensRelatorio;
  int id;
  // List<ItensRelatorio> classificacao;
  //List<Null> itensRelatorioClassificado;
  // List<ItensRelatorioDesclassificado> itensRelatorioDesclassificado;

  Relatorio({
    this.itensRelatorio,
    this.id
    // @required this.classificacao,
    //   this.itensRelatorioClassificado,
    //  this.itensRelatorioDesclassificado
  });

  Relatorio.fromJson(Map<String, dynamic> json) {
   // if (json['itensRelatorio'] != null) {
    //  itensRelatorio = new List<ItensRelatorio>();
   //   json['itensRelatorio'].forEach((v) {
    //    itensRelatorio.add(new ItensRelatorio.fromJson(v));
   //   });
 //   }
    var itensRelatorio = (json['itensRelatorio'])
        .map<ItensRelatorio>((item) => ItensRelatorio.fromJson(item))
        .toList();

    /*

    if (json['classificacao'] != null) {
      classificacao = new List<ItensRelatorio>();
      json['classificacao'].forEach((v) {
        classificacao.add(new ItensRelatorio.fromJson(v));
      });
    }
    /*
    if (json['itensRelatorioClassificado'] != null) {
      itensRelatorioClassificado = new List<Null>();
      json['itensRelatorioClassificado'].forEach((v) {
        itensRelatorioClassificado.add(new Null.fromJson(v));
      });
    }
    if (json['itensRelatorioDesclassificado'] != null) {
      itensRelatorioDesclassificado = new List<ItensRelatorioDesclassificado>();
      json['itensRelatorioDesclassificado'].forEach((v) {
        itensRelatorioDesclassificado
            .add(new ItensRelatorioDesclassificado.fromJson(v));


      });

     */
    }

      */

  }
}

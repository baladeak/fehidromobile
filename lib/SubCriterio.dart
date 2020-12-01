import 'package:flutter/cupertino.dart';
import 'package:teste_api/tipo_proposta.dart';

import 'Nota.dart';
import 'PerfilAcesso.dart';

class Subcriterio {
  int id;
  String letra;
  int numero;
  PerfilAcesso perfilAcesso;
  List<Nota> pontuacoes;
  List<TipoProposta> tiposProposta;
  String titulo;

  Subcriterio({
    @required this.id,
    @required this.letra,
    @required this.numero,
    @required this.perfilAcesso,
    @required this.pontuacoes,
    @required this.tiposProposta,
    @required this.titulo});

  Subcriterio.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    letra = json['letra'] as  String;
    numero = json['numero'] as int;
    perfilAcesso = json['perfilAcesso'] != null
        ? new PerfilAcesso.fromJson(json['perfilAcesso'])
        : null;
    if (json['pontuacoes'] != null) {
      pontuacoes = new List<Nota>();
      json['pontuacoes'].forEach((v) {
        pontuacoes.add(new Nota.fromJson(v));
      });
    }
    if (json['tiposProposta'] != null) {
      tiposProposta = new List<TipoProposta>();
      json['tiposProposta'].forEach((v) {
        tiposProposta.add(new TipoProposta.fromJson(v));
      });
    }
    titulo = json['titulo']as String;
  }
}
import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_api/Relatorio.dart';
import 'package:teste_api/avaliacao.dart';
import 'package:teste_api/subpdc.dart';

import 'Post.dart';

class HttpService {
  final String urlAvaliacao = "http://192.168.0.2:8081/avaliacao";
  final String urlRelatorio = "http://192.168.0.2:8081/relatorio/final";
  final String urlSubpdc1 = "http://192.168.0.2:8081/relatorio/subPdc/1";
  final String urlSubpdc2 = "http://192.168.0.2:8081/relatorio/subPdc/2";
  final String urlRelatorioSubPdc = "http://localhost:8081/subpdc";

  //"https://jsonplaceholder.typicode.com/posts";
  Future<List<Avaliacao>> getPosts() async {
    Response res = await get(urlAvaliacao);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Avaliacao> posts =
          body.map((dynamic item) => Avaliacao.fromJson(item)).toList();

      return posts;
    } else {
      throw "Cant get posts.";
    }
  }

  Future<Map<String, dynamic>> getFinal() async {
    Response res = await get(urlRelatorio);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
      print("resultado :" + body["itensRelatorio"][0]["soma"].toString());

      return body;
    } else {
      throw "Não pode encontrar os relatórios finais";
    }
  }

  Future<Map<String, dynamic>> getSubPdc(int id) async {
    Response res = await get(urlSubpdc1);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
     // print("resultado :" + body["itensRelatorio"][0]["soma"].toString());

      return body;
    } else {
      throw "Não pode encontrar os relatórios finais";
    }
  }

  Future<List<SubPdc>> getSubpdcs() async {
    Response res = await get(urlRelatorioSubPdc);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<SubPdc> posts =
      body.map((dynamic item) => SubPdc.fromJson(item)).toList();

      return posts;
    } else {
      throw "Não foi possivel retornar os subpdcs";
    }
  }
}

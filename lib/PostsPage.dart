import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste_api/Avaliacao_detalhe.dart';
import 'package:teste_api/Drawer.dart';
import 'package:teste_api/HttpService.dart';
import 'package:teste_api/avaliacao.dart';
import 'card_list_item.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliações"),
          backgroundColor: Color(0xFF26C6DA),
      ),
      drawer: Drawers(),
    body: FutureBuilder(
        future: httpService.getPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Avaliacao>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(
                      key: Key("circular"),
                    ),
                    Text('Carregando...'),

                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<Avaliacao> posts = snapshot.data;
                //utf8convert(avaliacao.proposta.nomeProjeto);
                //  utf8convert(avaliacao.proposta.instituicao.nome);

                return ListView.builder(
                  key: Key("ListView"),
                  itemBuilder: (context, index) {
                    final ava = posts[index];
                    return _AvaliacaoItem(ava);
                  },
                  itemCount: posts == null ? 0 : posts.length,
                );
              }
              break;
          }
          return Center(child: Text("Falha ao Carregar as Avaliações"));
        },
      ),
    );
  }
}

class _AvaliacaoItem extends StatelessWidget {
  final Avaliacao _avaliacao;

  _AvaliacaoItem(this._avaliacao);

  @override
  Widget build(BuildContext context) {
    String utf8convert(String text) {
      List<int> bytes = text.toString().codeUnits;
      return utf8.decode(bytes);
    }
    ;
   var s = _avaliacao.proposta.nomeProjeto.split(' ');
utf8convert(s[0]);
utf8convert(s[1]);
utf8convert(s[2]);
utf8convert(s[3]);
    return CardListItem(
      title: _avaliacao.proposta.instituicao.nome,
      subtitle: utf8convert(s[0])+" "+utf8convert(s[1])+" "+utf8convert(s[2])+ " "+utf8convert(s[3])+"...",

      //  subtitle: _proposta.avaliador.nome,

      press: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AvaliacaoDetalhe(avaliacao: _avaliacao)));
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(avaliacao: _proposta)));
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => AvaliacaoDetalhe()));
      },
    );
  }
}

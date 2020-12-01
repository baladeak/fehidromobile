import 'package:teste_api/Drawer.dart';
import 'package:teste_api/RelatorioSubPdcScreen.dart';
import 'package:teste_api/subpdc.dart';

import 'HttpService.dart';
import 'package:flutter/material.dart';

class RelatorioSubpdcselection extends StatefulWidget {
  @override
  _RelatorioSubpdcselectionState createState() => _RelatorioSubpdcselectionState();
}

class _RelatorioSubpdcselectionState extends State<RelatorioSubpdcselection> {
  int _escolhaUsuario;
  static const String _title = 'Relatório SubPDC';
  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(

        appBar: AppBar(title: const Text(_title), backgroundColor: Colors.black,),
        drawer: Drawers(),
        body: FutureBuilder(
          future: httpService.getFinal(),
          builder:
              (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
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
                  Map<String, dynamic> posts = snapshot.data;

                  //utf8convert(avaliacao.proposta.nomeProjeto);
                  //  utf8convert(avaliacao.proposta.instituicao.nome);

                  return Center(

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RadioListTile(
                              title: Text('Reuso'),
                              value: 1,
                              groupValue: _escolhaUsuario,
                              onChanged: (int escolha){
                                setState(() {
                                  _escolhaUsuario = escolha;
                                });
                              }
                          ),
                          RadioListTile(
                              title: Text('Disponibilidade') ,
                              value: 2,
                              groupValue: _escolhaUsuario,
                              onChanged: (int escolha){
                                setState(() {
                                  _escolhaUsuario = escolha;
                                });
                              }
                          ),
                          Padding(padding: EdgeInsets.all(20),),

                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>RelatorioSubPdcScreen(_escolhaUsuario)));

                            },
                            child: Container(

                              height: 50,
                              width: 150,
                              child: Center(

                                child: Text("Selecionar", style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(20, 133, 151, 1),
                                        Color.fromRGBO(38,198,218, 1),
                                      ]
                                  )
                              ),
                            ),
                          ),]),
                  );
                }
                break;
            }
            return Center(child: Text("Falha ao Carregar os SubPdcs"));
          },
        ),
      ),
    );
  }
}
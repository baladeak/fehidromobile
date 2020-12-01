import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_api/avaliacao.dart';




class AvaliacaoDetalhe extends StatelessWidget {
  final Avaliacao avaliacao;
  static String routeName = "/avaliacaoDetalhe";
   AvaliacaoDetalhe({Key key, @required this.avaliacao}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(avaliacao.proposta.instituicao.nome.toString()),
        backgroundColor: Color(0xFF26C6DA),
      ),
      //  drawer: Drawers(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Nome Projeto",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    utf8convert(
                    avaliacao.proposta.nomeProjeto)
                   // avaliacao.proposta.nomeProjeto
                    ,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Nome instituição",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      avaliacao.proposta.instituicao.nome.toString(),
                      style: TextStyle(fontSize: 20)),
                ),
                ListTile(
                  title: Text(
                    "Nome Avaliador",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      avaliacao.avaliador.nome,
                      style: TextStyle(fontSize: 20)),
                ),
                ListTile(
                  title: Text(
                    "Email ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      avaliacao.avaliador.email,
                      style: TextStyle(fontSize: 20)),
                ),
                ListTile(
                  title: Text(
                    "Pontuação nota ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      avaliacao.nota.pontos.toString(),
                      style: TextStyle(fontSize: 20)),
                ),
                ListTile(
                    title: Text(
                      "Desclassificavel ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        avaliacao.nota.desclassificavel
                            == true ? 'sim' : 'não',
                        style: TextStyle(fontSize: 20))),
                ListTile(
                  title: Text(
                    "Titulo Pontuação ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      avaliacao.nota.titulo,
                      style: TextStyle(fontSize: 20)),
                ),
                ListTile(
                  title: Text(
                    "Subcritério Titulo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(

                    utf8convert(avaliacao.subcriterio.titulo),

                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE34850),
        child: Icon(
          Icons.picture_as_pdf,
          color: Colors.black,
          size: 34,
        ),
          onPressed: ()async{
            writeOnPdf();
            await savePdf();

            Directory documentDirectory = await getApplicationDocumentsDirectory();

            String documentPath = documentDirectory.path;

            String fullPath = "$documentPath/example.pdf";

            Navigator.push(context, MaterialPageRoute(
                builder: (context) => PdfPreviewScreen(path: fullPath,)
            ));

          },
      ),

       */
    );
  }
  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    if(utf8.decode(bytes) == text){
      return text;
    }else{
      return utf8.decode(bytes);
    }

  }
}

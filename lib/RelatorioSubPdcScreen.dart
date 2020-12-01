import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_api/HttpService.dart';
import 'package:teste_api/subpdc.dart';
import 'package:teste_api/util_pdfSubpdc.dart';
import 'package:teste_api/utils_pdf.dart';

import 'Drawer.dart';

class RelatorioSubPdcScreen extends StatelessWidget {
  int id;
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Relatorio SubPDC',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text('Relatorio SubPDC'),
        ),
        drawer: Drawers(),
        body: FutureBuilder(
          future: httpService.getSubPdc(id),
          builder: (BuildContext context,
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
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  Map<String, dynamic> posts = snapshot.data;

                  DateTime data = DateTime.now();
                  String dataformatada = (DateFormat("'Data numérica:' dd/MM/yyyy").format(data));
                  print((DateFormat("'Data numérica:' dd/MM/yyyy").format(data)));
                  if(id == 0) {
                    GeneratePDFSubPdc generatePdf = GeneratePDFSubPdc(
                        posts, dataformatada);
                    generatePdf.generatePDFInvoice();
                  }
                  // child: Icon(Icons.print),


                }
                break;
            }
            return Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    key: Key("circular"),
                  ),
                  Text('Carregando...')
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  RelatorioSubPdcScreen(this.id);
}

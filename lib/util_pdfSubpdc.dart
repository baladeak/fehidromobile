
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:teste_api/subpdc.dart';

class GeneratePDFSubPdc {
  Map<String, dynamic> snapshot;
  String data;
  GeneratePDFSubPdc(this.snapshot,
      this.data
      );


  /// Cria e Imprime a fatura
  generatePDFInvoice() async {
    final pw.Document doc = pw.Document();
    final pw.Font customFont =
    pw.Font.ttf((await rootBundle.load('assets/RobotoSlabt.ttf')));
    doc.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
            margin: pw.EdgeInsets.zero,
            theme:
            pw.ThemeData(defaultTextStyle: pw.TextStyle(font: customFont))),
        header: _buildHeader,
        // footer: _buildPrice,
        build: (context) => _buildContent(context),
      ),
    );
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  /// Constroi o cabeçalho da página
  pw.Widget _buildHeader(pw.Context context) {

    return pw.Container(
        color: PdfColors.cyan,
        height: 150,
        child: pw.Padding(
            padding: pw.EdgeInsets.all(16),
            child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.all(8), child: pw.PdfLogo()),
                        pw.Text(
                            'Relatório Final'
                            ,
                            style: pw.TextStyle(
                                fontSize: 22, color: PdfColors.white))
                      ]),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Portal CBH-BS',
                          style: pw.TextStyle(
                              fontSize: 22, color: PdfColors.white)),
                      pw.Text('Relatório gerado automaticamente',
                          style: pw.TextStyle(color: PdfColors.white)),
                      pw.Text(data,
                          style: pw.TextStyle(color: PdfColors.white)),
                    ],
                  )
                ])));
  }

  /// Constroi o conteúdo da página
  List<pw.Widget> _buildContent(pw.Context context) {
    return [
      //  pw.Padding(
      //      padding: pw.EdgeInsets.only(top: 30, left: 25, right: 25),
      //      child: _buildContentClient()),
      pw.Padding(
          padding: pw.EdgeInsets.only(top: 50, left: 25, right: 25),
          child: _contentTable(context)),
    ];
  }


  /// Retorna um texto com formatação própria para título
  _titleText(String text) {
    return pw.Padding(
        padding: pw.EdgeInsets.only(top: 8),
        child: pw.Text(text,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)));
  }

  /// Constroi uma tabela com base nos produtos da fatura
  pw.Widget _contentTable(pw.Context context) {
    // Define uma lista usada no cabeçalho
    const tableHeaders = ['Título#', 'Classificacação Geral', 'SubPDC', 'Classificacação subpdc', 'Nota'];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: 2,
      ),
      headerHeight: 25,
      cellHeight: 40,
      // Define o alinhamento das células, onde a chave é a coluna
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.center,
        4: pw.Alignment.centerRight,
      },
      // Define um estilo para o cabeçalho da tabela
      headerStyle: pw.TextStyle(
        fontSize: 10,
        color: PdfColors.blue,
        fontWeight: pw.FontWeight.bold,
      ),
      // Define um estilo para a célula
      cellStyle: const pw.TextStyle(
        fontSize: 10,
      ),
      // Define a decoração
      rowDecoration: pw.BoxDecoration(
        border: pw.BoxBorder(
          bottom: true,
          color: PdfColors.blue,
          width: .5,
        ),
      ),
      headers: tableHeaders,
      // retorna os valores da tabela, de acordo com a linha e a coluna
      data: List<List<String>>.generate(
        3,
            (row) => List<String>.generate(
          tableHeaders.length,
              (col) => _getValueIndex(row, col),
        ),
      ),
    );
  }
  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
  /// Retorna o valor correspondente a coluna
  String _getValueIndex(int row, int col) {

    switch (col) {
      case 0:
        return
          utf8convert(snapshot["itensRelatorio"][row]["proposta"]["nomeProjeto"]);
      case 1:
        return
          utf8convert('s');
      case 2:
        return utf8convert('s');
      case 3:
        return
          utf8convert('s');
      case 4:
        return
          utf8convert('s');
    }
    return '';
  }

  /// Formata o valor informado na formatação pt/BR
  String _formatValue(double value) {
    final NumberFormat numberFormat = new NumberFormat("#,##0.00", "pt_BR");
    return numberFormat.format(value);
  }



  /// Retorna o rodapé da página
}

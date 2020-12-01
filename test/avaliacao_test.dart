/*// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_api/Avaliacao_detalhe.dart';
import 'package:teste_api/PostsPage.dart';
import 'package:teste_api/avaliacao.dart';
import 'dart:ui';

void main() {
  Avaliacao avaliacao;

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AvaliacaoDetalhe());

    // Verify that our counter starts at 0.
    expect(find.text('Nome projeto'), findsOneWidget);
  // expect(find.text('Prefeitura'), findsNothing);

    // Tap the '+' icon and trigger a frame.
 //   await tester.tap(find.byIcon(Icons.add));
 //   await tester.pump();

    // Verify that our counter has incremented.
  //  expect(find.text('0'), findsNothing);
  //  expect(find.text('1'), findsOneWidget);
  });
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_api/PostsPage.dart';

void main() {
  testWidgets('teste widget', (WidgetTester tester) async {
    await _createWidget(tester);

    final setaforward = find.byKey(ValueKey("circular"));

    //Encontrando um text
    expect(find.text('Avaliações'), findsOneWidget);
    // expect(find.byType(Drawer), findsOneWidget);
    // expect(find.text('Prefeitura de Santos'), find);
    //await tester.tap(setaforward);
    //expect(find.byType(ListView), findsOneWidget);
    await tester.pump();
    //ENCONTRANDO UM WIDGET PELA KEY
//    expect(find.byKey(Avaliacao2.listKey), findsOneWidget);

    //ENCONTRANDO WIDGET PELO TIPO
    //  expect(find.byType(Drawer), findsOneWidget);
    //  await tester.tap(find.byIcon(Icons.arrow_forward_ios));
    // await tester.pump();
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      title: 'teste tela avaliacao',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: PostPage(),
    ),
  );

  await tester.pump();
}

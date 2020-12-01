import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_api/RelatorioFinalScreen.dart';
import 'package:teste_api/RelatorioSubPdc.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Menu Fehidro'),
          // backgroundColor: Color.fromRGBO(23, 162, 184, 100),
          backgroundColor: Color(0xFF26C6DA),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              ItensMenu(title: "SubPDC", icon: Icons.article_outlined),
              ItensMenu(
                  title: "Final", icon: Icons.assignment_turned_in_outlined),
            ],
          ),
        ));
  }
}

class ItensMenu extends StatelessWidget {
  ItensMenu({
    this.title,
    this.icon,
  });

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Card(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (title == "Final") {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RelatorioFinalScreen()));



            }
            if (title == "SubPDC") {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }
          },
          splashColor: Colors.green,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  icon,
                  size: 80,
                  color: Colors.black,
                ),
                Text(title,
                    style: TextStyle(fontSize: 25.0, color: Colors.black)),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

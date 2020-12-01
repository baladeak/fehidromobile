import 'package:flutter/material.dart';
import 'package:teste_api/Inicio.dart';

import 'Menu.dart';
import 'PostsPage.dart';

class Drawers extends StatelessWidget {
  Drawers({ListView listView});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text("Matheus",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            accountEmail: new Text("sabino2@unisantos.br"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
              NetworkImage("https://www.sigrb.com.br/img/fehidro.png"),
            ),
            decoration: new BoxDecoration(color: Color(0xFF26C6DA)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Perfil"),

          ),
          ListTile(
            leading: Icon(Icons.assignment_turned_in_outlined),
            title: Text("Avaliação"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => PostPage()));


            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text("Relátorio"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Inicio()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sair"),
          ),
        ],
      ),
    );
  }
}

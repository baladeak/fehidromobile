import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_api/RelatorioFinalScreen.dart';
import 'package:teste_api/relatorioSubPdcSelection.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        width: 600,
         height: 800,

         decoration: BoxDecoration(color: Color(0xffffffff)),
        child: SingleChildScrollView(

          child: Column(
           /// mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
            Container(
              
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/fehidro.png"),
                      fit: BoxFit.contain
                  )
              ),
            ),
            Padding(

              padding: EdgeInsets.only(left: 10,top: 50, right: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
               SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>RelatorioFinalScreen()));

                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Center(

                      child: Text("Final", style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(193, 166, 93, 1),
                              Color.fromRGBO(177,153,83, 1),
                            ]
                        )
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                SizedBox(width: 20, ),
                InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>RelatorioSubpdcselection()));
                   //Navigator.push(context, MaterialPageRoute(builder: (context) =>Avaliacao()));

                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    child: Center(
                      child: Text("SubPDC", style: TextStyle(
                          color: Color.fromRGBO(00, 0, 0, 1), fontSize: 20,
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
                )
              ],),

            )
          ],),
        ),
      ),
    );
    ;
  }
}

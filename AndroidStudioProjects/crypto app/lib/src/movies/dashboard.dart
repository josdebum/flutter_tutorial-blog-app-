import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_app/src/movies/crypto_page.dart';

class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F9F9FA"),
        body: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20,0),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[

                Text("History", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                SizedBox(width: 60,),

                Row(children: <Widget>[ Icon(Icons.settings_input_component), SizedBox(width: 10),
                  Text("Sort/Filter", style: TextStyle (fontSize: 20,fontWeight: FontWeight.bold ),),])

              ]
            )),
            Expanded(
                child: MoviesPage())
          ]
        ));

  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/movies/crypto_cubit.dart';
import 'package:movie_app/src/movies/crypto_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';



class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  List<String> list = ["Received", "Sent","Sent","Received", "Sent"];

  @override
  Widget build(BuildContext context) {
    list.shuffle();
    return  BlocBuilder<MoviesCubit, CryptoState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final coins = state.coins;

            return ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) =>
                    Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 12,12),
                        child:
                        Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Row(children: <Widget>[
                                Card(
                                    color: Colors.white,
                                    shape:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    child: Container (height: 160,width: 120,padding: EdgeInsets.all(42),
                                      child:Image.network(coins[index].image,),)
                                ),
                                SizedBox(width: 8),
                                Column (
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text (
                                        list[0],  textAlign: TextAlign.right,),
                                      SizedBox(height: 20,),
                                      Text ( coins[index].current_price.toString()+" "+ coins[index].name,
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      SizedBox(height: 20),

                                      Align (
                                          alignment: Alignment.bottomCenter,
                                          child:


                                          Row (children: <Widget>[Text(
                                            DateFormat.Hm()
                                                .format(DateTime.parse(coins[index].last_updated)),
                                            style: TextStyle(
                                                color: HexColor("#ADADBD")
                                            ),

                                          )  ,

                                            Text(" ,", style: TextStyle(color: HexColor("#ADADBD")),),
                                            SizedBox(width: 4),
                                            Text(
                                              DateFormat.yMMMd()
                                                  .format(DateTime.parse(coins[index].last_updated)),
                                              style: TextStyle(
                                                  color: HexColor("#ADADBD")
                                              ),

                                            )  ])),
                                    ]),
                              ]),

                              SizedBox(width: 10,),

                              Expanded(child:
                              Align(
                                  alignment: Alignment.centerRight,
                                  child:
                                  Text( '\$ ${coins[index].price_change_percentage_24h.toStringAsFixed(2)}'.toString(),
                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),)
                              ),
                              )])

                    ));
          } else {
            return Container();
          }
        },

    );
  }
}

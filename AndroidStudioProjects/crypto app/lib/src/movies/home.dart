import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:movie_app/src/movies/dashboard.dart';
import 'package:movie_app/src/movies/glabal.dart';
import 'package:movie_app/src/movies/notification.dart';
import 'package:movie_app/src/movies/profile.dart';

class HomeScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeCtScreen(),
    );
  }
}

class HomeCtScreen extends StatefulWidget {
  @override
  _HomeCtScreenState createState() => _HomeCtScreenState();
}

class _HomeCtScreenState extends State<HomeCtScreen> {
  int _currentIndex = 0;
  List _screens = [
    DashboardScreen(),
    GlobalScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        selectedItemColor:Colors.black ,
        unselectedItemColor: Colors.black12,

        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.bar_chart_outlined, size: 30),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Linecons.globe, size: 30),
          ),
          BottomNavigationBarItem(
            label: "",


            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.notifications_none, size: 30,),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      "13",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.person_outline_outlined, size: 30),
          ),
        ],
      ),
    );
  }
}

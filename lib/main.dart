import 'package:flutter/material.dart';
import 'package:label_lab/screens/HomePage.dart';
import 'package:label_lab/screens/newhomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'LabelLab',
        routes: <String, WidgetBuilder>{
//          '/home': (context) => MyHomePage(),
        '/home':(context) => NewHomePage(),
//          '/second': (context) => SecondHome(),
        },
        theme: ThemeData(
          primaryColor: Colors.white,

          accentColor: Colors.white,
        ),
        home: NewHomePage(),
      ),
    );
  }
}
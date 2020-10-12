import 'package:client_app/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client App',
      debugShowMaterialGrid: false,
      theme: ThemeData(
          // scaffoldBackgroundColor: Hexcolor('#ccccff'),
      ),
      home: HomePage(),
    );
  }
}


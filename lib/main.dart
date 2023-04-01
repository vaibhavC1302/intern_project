import 'package:flutter/material.dart';
import 'package:intern_project/swapeth.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    home: MainPage(),
  ));
}

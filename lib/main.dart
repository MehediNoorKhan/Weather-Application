// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
//Final Project by Mehedi Noor Khan 2020722 and Ali Daud Hossain 1930544

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(cityName: 'dhaka'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/PokedexHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokedexHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

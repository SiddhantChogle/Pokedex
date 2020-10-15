import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/Repository/pokemonModel.dart';

class PokedexHomePage extends StatefulWidget {
  @override
  _PokedexHomePageState createState() => _PokedexHomePageState();
}

class _PokedexHomePageState extends State<PokedexHomePage> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokemonModel pokemonModel;

  @override
  void initState() {
    fetchPokemon();
    super.initState();
  }

  fetchPokemon() async {
    var pokemonFuture = await http.get(url);
    // print(pokemonFuture.body);
    var decoded = json.decode(pokemonFuture.body);
    // print(decoded);
    pokemonModel = PokemonModel.fromJson(decoded);
    // print(pokemonModel);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pokedex"),
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
          ],
        ),
      ),
      drawer: Drawer(),
      body: pokemonModel == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 3,
              children: pokemonModel.pokemon
                  .map((Pokemon poke) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(poke.img),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                poke.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/Repository/pokemonModel.dart';
import 'package:pokedex/pokemonDetails.dart';

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
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  "Generations:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(thickness: 1.5, height: 0),
              ListTile(
                title: Text(
                  "Gen 1",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
              Divider(thickness: 1.5, height: 0),
              ListTile(
                title: Text(
                  "Gen 2",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
              Divider(thickness: 1.5, height: 0),
              ListTile(
                title: Text(
                  "Gen 3",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
              Divider(thickness: 1.5, height: 0),
            ],
          ),
        ),
      ),
      body: pokemonModel == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 3,
              children: pokemonModel.pokemon
                  .map((Pokemon poke) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PokemonDetailsPage(pokemon: poke)));
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Hero(
                                    tag: poke.img,
                                    child: Container(
                                      height: 85,
                                      width: 85,
                                      child: CachedNetworkImage(
                                          imageUrl: poke.img),
                                    ),
                                  ),
                                ),
                                Text(
                                  poke.name,
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}

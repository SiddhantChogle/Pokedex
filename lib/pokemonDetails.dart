import 'package:flutter/material.dart';
import 'Repository/pokemonModel.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailsPage({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Color(0xffea1c24),
        elevation: 0,
      ),
      body: pageWidget(context),
      backgroundColor: Color(0xffea1c24),
      // body: Container(Image(image: AssetImage("Pokedexbg.png"))),
    );
  }

  pageWidget(BuildContext context) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/Pokedexbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 30,
                height: MediaQuery.of(context).size.height * 0.53,
                width: MediaQuery.of(context).size.width - 60,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        pokemon.name,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Height: ${pokemon.height}",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Weight: ${pokemon.weight}",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Type:",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.type
                            .map((poke) => FilterChip(
                                label: Text(
                                  poke,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                backgroundColor: Colors.yellowAccent[700],
                                onSelected: (b) {}))
                            .toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Weakness:",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: 20),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.weaknesses
                              .map((poke) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: FilterChip(
                                        label: Text(
                                          poke,
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        labelPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        backgroundColor:
                                            Colors.lightBlueAccent[400],
                                        onSelected: (b) {}),
                                  ))
                              .toList(),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.0, -0.45),
                child: Hero(
                  tag: pokemon.img,
                  child: Container(
                    height: 165,
                    width: 165,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pokemon.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );
}

import 'package:flutter/material.dart';

import '../dataHelper/PokemonApi.dart';
import '../models/Pokemon.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({Key? key}) : super(key: key);

  @override
  _PokemonListWidgetState createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: PokemonApi.getPokemonData(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          var pokemonListe = snapshot.data;
          return ListView.builder(
              itemCount: pokemonListe!.length,
              itemBuilder: (context,indeks){
                var pokemon = pokemonListe[indeks];
                return ListTile(
                  title: Text(pokemon.name.toString()),
                );
              },
          );
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}

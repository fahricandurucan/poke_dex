import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/widgets/PokeListItem.dart';

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
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2 : 3,
                childAspectRatio: 1/1
              ),
              itemCount: pokemonListe!.length,
              itemBuilder: (context,index){
                var pokemon = pokemonListe[index];
                return PokeListItem(pokemon: pokemon,);
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

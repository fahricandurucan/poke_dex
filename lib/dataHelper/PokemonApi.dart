import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poke_dex/models/Pokemon.dart';

class PokemonApi{
  
  
  
  static Future<List<Pokemon>> getPokemonData() async{
     try{
       List<Pokemon> pokemonList = [];
       var response = await Dio().get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
       var result = jsonDecode(response.data);

       if(response.statusCode == 200){ // ==200 means there is not any error
         pokemonList = (result["pokemon"] as List)
         .map((e) => Pokemon.fromMap(e)).toList();
         return pokemonList;
       }
       return pokemonList;   // return a empty list
     }
     on DioError catch(e){
       return Future.error(e.message);
     }
    
  }
  
}
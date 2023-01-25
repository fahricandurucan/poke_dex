import 'package:flutter/material.dart';
import 'package:poke_dex/dataHelper/PokemonApi.dart';
import 'package:poke_dex/models/Pokemon.dart';
import 'package:poke_dex/widgets/AppTitleWidget.dart';
import 'package:poke_dex/widgets/PokemonListWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [
          AppTitleWidget(),
          Expanded(
              child: PokemonListWidget(),
              ),
        ],
      ),
    );
  }
}

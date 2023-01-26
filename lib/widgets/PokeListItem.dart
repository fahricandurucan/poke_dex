import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/UI_helper/UIHelper.dart';

import '../models/Pokemon.dart';

class PokeListItem extends StatelessWidget {
  late Pokemon pokemon;
  PokeListItem({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UIHelper.getColorFromType(pokemon.type![0] ?? ""),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pokemon.name ?? "",
              style: TextStyle(fontSize: 20.w,fontWeight: FontWeight.bold),),
           
            Chip(label: Text(pokemon.type![0])),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset("images/pokeball.png",
                      fit: BoxFit.fitHeight,
                      height: UIHelper.sizeOfPokemonImgAndPokeBall(),
                      width: UIHelper.sizeOfPokemonImgAndPokeBall(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? "",
                      width: UIHelper.sizeOfPokemonImgAndPokeBall(),
                      height: UIHelper.sizeOfPokemonImgAndPokeBall(),
                      fit: BoxFit.fitHeight,
                      placeholder: (context,url) => CircularProgressIndicator(color: Colors.red,),
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}

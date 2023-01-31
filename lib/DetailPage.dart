
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/UI_helper/UIHelper.dart';
import 'package:poke_dex/models/Pokemon.dart';

class DetailPage extends StatelessWidget {

  late Pokemon pokemon;
  DetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0] ?? ""),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,
                    size: 18.w,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(pokemon.name ?? "",style: TextStyle(fontSize: 28.w),),
                      Text("#${pokemon.num}",style: TextStyle(fontSize: 28.w)),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left:20.w),
                  child: Row(
                    children: [
                      Chip(label: Text(typesPoke(),style: TextStyle(fontSize: 18),),),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      child: Image.asset("images/pokeball.png",
                        fit: BoxFit.fitHeight,
                        height: 0.15.sh,
                      ),
                    right: 0,
                    top: 0,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: UIHelper.getIconPadding(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              pokemonInfoText("Name",pokemon.name),
                              pokemonInfoText("Height",pokemon.height),
                              pokemonInfoText("Weight",pokemon.weight),
                              pokemonInfoText("Spawn Time",pokemon.spawnTime),
                              pokemonInfoText("Weakness",pokemon.weaknesses),
                              pokemonInfoText("Pre Evolution",pokemon.prevEvolution),
                              pokemonInfoText("Next Evolution",pokemon.nextEvolution),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                      child:  CachedNetworkImage(imageUrl: pokemon.img ?? "",height: 0.25.sh,fit: BoxFit.fitHeight,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String typesPoke(){
    String str = "";
    for(int i = 0; i<pokemon.type!.length;i++){
      if(i+1==pokemon.type!.length){
        str+=pokemon.type![i];
      }
      else{
        str += pokemon.type![i]+", ";
      }


    }
    return str;
  }

  pokemonInfoText(String title,dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 20.w,
              color: Colors.black),),
        if(value is List && value.isNotEmpty)
          Text(value.join(' , '),style: TextStyle(color: Colors.black))
        else if(value == null)
          const Text("Not avaliable",style: TextStyle(color: Colors.black))
        else
          Text(value,style: TextStyle(color: Colors.black))
      ],
    );
  }

}




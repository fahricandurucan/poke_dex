import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text("Pokedex",style: TextStyle(fontSize: 36),),
        ),
        Positioned(
          right: -5,
          child: Image.asset("images/pokeball.png",width: 100,),
        ),
      ],
    );
  }
}

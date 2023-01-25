import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/Pokemon.dart';

class PokeListItem extends StatelessWidget {
  late Pokemon pokemon;
  PokeListItem({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(pokemon.name.toString(),
                  style: TextStyle(fontSize: 24),),
              ],
            ),
          ),
          Padding(
              padding:EdgeInsets.all(8.w),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40.w,
                  width: 80.w,
                  child: Text(pokemon.type![0].toString(),style: TextStyle(fontSize: 18),),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(25.w),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper{
  UIHelper._(); // object can not be created

  //dikey modda ise ekran yüksekliğinin %15 i olsun
  //dikey modda değilse genişiliğin %15 i olsujn
  static double getAppTitleWidgetHeight(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }
  
  static EdgeInsets getDefaultPadding(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return EdgeInsets.all(12.h);
    }
    else{
      return EdgeInsets.all(8.w);
    }
  }

  static double sizeOfPokemonImgAndPokeBall(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return 0.2.sw;
    }
    else{
      return 0.3.sh;
    }
  }

  static Map<String,Color> typeColorMap(){
    Map<String,Color> map = {
      'Grass':Colors.green,
      "Fire":Colors.redAccent,
      "Water":Colors.blue,
      "Electric":Colors.yellow,
      "Rock":Colors.grey,
      "Ground":Colors.brown,
      "Bug":Colors.lightGreenAccent.shade700,
      "Psychic":Colors.indigo,
      "Fighting":Colors.orange,
      "Ghost":Colors.deepPurple,
      "Normal":Colors.black26,
      "Poison":Colors.deepPurpleAccent,
  };
    return map;
  }

  static Color getColorFromType(String type){
    if(typeColorMap().containsKey(type)){
      return typeColorMap()[type] ?? Colors.pink.shade300;
    }
    else{
      return Colors.pink.shade300;
    }
  }


}
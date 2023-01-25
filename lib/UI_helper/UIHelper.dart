import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper{
  UIHelper._(); // object can not be created

  //dikey modda ise ekran yüksekliğinin %15 i olsun
  //dikey modda değilse genişiliğin %15 i olsujn
  static double getAppTitleWidgetHeight(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }
}
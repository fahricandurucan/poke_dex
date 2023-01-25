import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/UI_helper/UIHelper.dart';

class AppTitleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.all(8.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Pokedex",
                style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold),),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("images/pokeball.png",
              width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

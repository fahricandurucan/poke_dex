import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex/HomePage.dart';
import 'package:poke_dex/dataHelper/PokemonApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PokemonApi.getPokemonData();
    return ScreenUtilInit(    //edits the design for different screen sizes accordingly.
        designSize: const Size(412,732),
        builder: ((context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            home: HomePage(),
          );
        }),
    );
  }
}


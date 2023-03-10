// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

Pokemon pokemonFromMap(String str) => Pokemon.fromMap(json.decode(str));

String pokemonToMap(Pokemon data) => json.encode(data.toMap());

class Pokemon {
  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
  });

  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  double? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<Evolution>? prevEvolution;
  List<Evolution>? nextEvolution;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    type: json["type"] == null ? null : List<String>.from(json["type"]!.map((x) => x)),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    candyCount: json["candy_count"],
    egg: json["egg"],
    spawnChance: json["spawn_chance"]?.toDouble(),
    avgSpawns: json["avg_spawns"]?.toDouble(),
    spawnTime: json["spawn_time"],
    multipliers: json["multipliers"] == null ? null : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
    weaknesses: json["weaknesses"] == null ? null : List<String>.from(json["weaknesses"]!.map((x) => x)),
    prevEvolution: json["prev_evolution"] == null ? null : List<Evolution>.from(json["prev_evolution"]!.map((x) => Evolution.fromMap(x))),
    nextEvolution: json["next_evolution"] == null ? null : List<Evolution>.from(json["next_evolution"]!.map((x) => Evolution.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
    "height": height,
    "weight": weight,
    "candy": candy,
    "candy_count": candyCount,
    "egg": egg,
    "spawn_chance": spawnChance,
    "avg_spawns": avgSpawns,
    "spawn_time": spawnTime,
    "multipliers": multipliers == null ? [] : List<dynamic>.from(multipliers!.map((x) => x)),
    "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x)),
    "prev_evolution": prevEvolution == null ? [] : List<dynamic>.from(prevEvolution!.map((x) => x.toMap())),
    "next_evolution": nextEvolution == null ? [] : List<dynamic>.from(nextEvolution!.map((x) => x.toMap())),
  };
}

class Evolution {
  Evolution({
    this.num,
    this.name,
  });

  String? num;
  String? name;

  factory Evolution.fromMap(Map<String, dynamic> json) => Evolution(
    num: json["num"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "num": num,
    "name": name,
  };

  @override
  String toString() {
    // TODO: implement toString
    return "$name";
  }

}

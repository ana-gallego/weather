import 'dart:convert';

import 'package:weather/core/entities/weather.dart';

class ForecastResult {
  ForecastResult({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory ForecastResult.fromJson(String str) =>
      ForecastResult.fromMap(json.decode(str));

  factory ForecastResult.fromMap(Map<String, dynamic> json) {
    final weather = (json['list'] as List<dynamic>)
        .map((e) => Weather.fromMap(e as Map<String, dynamic>))
        .toList();

    return ForecastResult(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: weather,
      city: json['city'] == null ? null : City.fromMap(json['city']),
    );
  }
  String? cod;
  int? message;
  int? cnt;
  List<Weather>? list;
  City? city;
}

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['name'],
        coord: json['coord'] == null ? null : Coord.fromMap(json['coord']),
        country: json['country'],
        population: json['population'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;
}

class ListElement {
  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  factory ListElement.fromJson(String str) =>
      ListElement.fromMap(json.decode(str));

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        dt: json['dt'],
        main: json['main'] == null ? null : Main.fromMap(json['main']),
        weather: json['weather'] == null
            ? []
            // ignore: avoid_dynamic_calls
            : List<Weather>.from(json['weather']!.map(Weather.fromMap)),
        clouds: json['clouds'] == null ? null : Clouds.fromMap(json['clouds']),
        wind: json['wind'] == null ? null : Wind.fromMap(json['wind']),
        visibility: json['visibility'],
        pop: json['pop'],
        sys: json['sys'] == null ? null : Sys.fromMap(json['sys']),
        dtTxt: json['dt_txt'] == null ? null : DateTime.parse(json['dt_txt']),
        rain: json['rain'] == null ? null : Rain.fromMap(json['rain']),
      );
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  num? pop;
  Sys? sys;
  DateTime? dtTxt;
  Rain? rain;
}

class Rain {
  Rain({
    this.the3H,
  });

  factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the3H: json['3h'],
      );
  num? the3H;
}

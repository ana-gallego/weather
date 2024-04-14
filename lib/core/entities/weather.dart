import 'dart:convert';

class Weather {
  Weather({
    this.coord,
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  factory Weather.fromMap(Map<String, dynamic> json) {
    final weatherElements = (json['weather'] as List<dynamic>)
        .map((e) => WeatherElement.fromMap(e as Map<String, dynamic>))
        .toList();

    return Weather(
      coord: json['coord'] == null ? null : Coord.fromMap(json['coord']),
      weather: weatherElements,
      main: json['main'] == null ? null : Main.fromMap(json['main']),
      visibility: json['visibility'],
      wind: json['wind'] == null ? null : Wind.fromMap(json['wind']),
      clouds: json['clouds'] == null ? null : Clouds.fromMap(json['clouds']),
      dt: json['dt'],
      sys: json['sys'] == null ? null : Sys.fromMap(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
  Coord? coord;
  List<WeatherElement>? weather;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  DateTime get date {
    return DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
  }
}

class Clouds {
  Clouds({
    this.all,
  });

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json['all'],
      );
  int? all;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'all': all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json['lon'],
        lat: json['lat'],
      );
  num? lon;
  num? lat;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'lon': lon,
        'lat': lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(String str) => Main.fromMap(json.decode(str));

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      );
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  int? pressure;
  int? humidity;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;
}

class WeatherElement {
  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherElement.fromJson(String str) =>
      WeatherElement.fromMap(json.decode(str));

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
  int? id;
  String? main;
  String? description;
  String? icon;
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json['speed'],
        deg: json['deg'],
      );
  num? speed;
  num? deg;
}

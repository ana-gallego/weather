// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/core/entities/location.dart';
import 'package:weather/core/entities/weather.dart';

class Place {
  final String name;
  final Weather weather;
  final List<Weather> forecast;
  final Location? location;
  final String? imageUrl;

  Place({
    required this.name,
    required this.weather,
    required this.forecast,
    this.location,
    this.imageUrl,
  });

  Place copyWith({
    String? name,
    Weather? weather,
    List<Weather>? forecast,
    Location? location,
    String? imageUrl,
  }) {
    return Place(
      name: name ?? this.name,
      weather: weather ?? this.weather,
      forecast: forecast ?? this.forecast,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

import 'dart:convert';

class Location {
  Location(
    this.latitude,
    this.longitude,
  );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        (json['latitude'] as num? ?? 0).toDouble(),
        (json['longitude'] as num? ?? 0).toDouble(),
      );
  double latitude;
  double longitude;
}

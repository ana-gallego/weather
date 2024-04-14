// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather/core/entities/location.dart';

class PlacesResult {
  List<Place>? places;

  PlacesResult({this.places});

  factory PlacesResult.fromJson(String str) =>
      PlacesResult.fromMap(json.decode(str));

  factory PlacesResult.fromMap(Map<String, dynamic> json) {
    final places = (json['places'] as List<dynamic>)
        .map((e) => Place.fromMap(e as Map<String, dynamic>))
        .toList();

    return PlacesResult(places: places);
  }
}

class Place {
  Location? location;

  Place({
    this.location,
  });

  factory Place.fromJson(String str) => Place.fromMap(json.decode(str));

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        location: json['location'] == null
            ? null
            : Location.fromMap(json['location']),
      );
}

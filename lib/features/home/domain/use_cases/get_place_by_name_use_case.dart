import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/entities/location.dart';
import 'package:weather/core/entities/places_result.dart';
import 'package:weather/core/network/response_extension.dart';
import 'package:weather/core/utils/constants.dart';

class GetPlaceByNameUseCase {
  Future<Location> call(String place) async {
    try {
      const url = 'https://places.googleapis.com/v1/places:searchText';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': kPlacesClientApiKey,
          'X-Goog-FieldMask': 'places.id,places.displayName,places.location',
        },
        body: json.encode({'textQuery': place}),
      );
      final data = response.toApiResponse<String>().data!;
      final result = PlacesResult.fromJson(data);

      return result.places!.first.location!;
    } catch (e) {
      rethrow;
    }
  }
}

final getPlaceByNameUseCase = Provider((ref) => GetPlaceByNameUseCase());

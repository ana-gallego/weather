// ignore_for_file: cascade_invocations

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/network/response_extension.dart';
import 'package:weather/core/utils/constants.dart';

class GetImageBgUseCase {
  Future<String> call(String place) async {
    try {
      final query = place.split(',').first;
      final url = 'https://api.unsplash.com/search/photos?'
          'page=1&'
          'query=$query&'
          'client_id=$kUnsplashClientId';
      final response = await http.get(Uri.parse(url));
      final data = response.toApiResponse<String>().data!;
      final doc = json.decode(data) as Map<String, dynamic>;
      final results = doc['results'] as List<dynamic>;
      results.shuffle();
      final first = results.first as Map<String, dynamic>;

      return (first['urls'] as Map<String, dynamic>)['full'];
    } catch (e) {
      rethrow;
    }
  }
}

final getImageBgUseCase = Provider((ref) => GetImageBgUseCase());

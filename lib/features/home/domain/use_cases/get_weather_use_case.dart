import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/entities/weather.dart';
import 'package:weather/core/network/response_extension.dart';
import 'package:weather/core/utils/app_logger.dart';
import 'package:weather/core/utils/constants.dart';

class GetWeatherUseCase {
  Future<Weather> call({
    required double lat,
    required double lon,
  }) async {
    try {
      final url = 'https://api.openweathermap.org/data/2.5/weather?'
          'lat=$lat&'
          'lon=$lon&'
          'appid=$kOpenWeatherAppId&'
          'units=metric';
      final response = await http.get(Uri.parse(url));

      return Weather.fromJson(response.toApiResponse<String>().data ?? '');
    } catch (e) {
      logger.e('there was an error getting the weather', error: e);
      rethrow;
    }
  }
}

final getWeatherUseCase = Provider((ref) => GetWeatherUseCase());

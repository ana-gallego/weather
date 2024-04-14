import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/entities/location.dart';
import 'package:weather/core/entities/place.dart';
import 'package:weather/core/utils/app_logger.dart';
import 'package:weather/features/home/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather/features/home/domain/use_cases/get_image_bg_use_case.dart';
import 'package:weather/features/home/domain/use_cases/get_place_by_name_use_case.dart';
import 'package:weather/features/home/domain/use_cases/get_weather_use_case.dart';
import 'package:weather/features/home/presentation/home/home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() => HomeState();

  Future<void> init() async {
    try {
      final position = await _determinePosition();
      final coords = Location(position.latitude, position.longitude);

      final currentPlace = await getPlaceData(coords);
      state = state.copyWith(currentPlace: currentPlace);

      unawaited(getSavedPlacesWeather());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSavedPlacesWeather() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coords = prefs.getStringList('coords');
      if (coords == null) return;
      final places = await Future.wait(
        coords.map((coord) async {
          final doc = json.decode(coord) as Map<String, dynamic>;
          final lat = doc['lat'];
          final lon = doc['lon'];
          return getPlaceData(Location(lat, lon), doc['name'] as String?);
        }),
      );
      state = state.copyWith(places: places);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<Place> getPlaceData(Location coordinates, [String? name]) async {
    try {
      final weather = await ref.read(getWeatherUseCase).call(
            lat: coordinates.latitude,
            lon: coordinates.longitude,
          );

      final forecast = await ref.read(getForecastUseCase).call(
            lat: coordinates.latitude,
            lon: coordinates.longitude,
          );

      final background = await getBackgroundImage(name ?? 'landscape');

      return Place(
        name: name ?? weather.name ?? 'Unknown',
        weather: weather,
        forecast: forecast,
        location: coordinates,
        imageUrl: background,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<String?> getBackgroundImage(String place) async {
    try {
      return await ref.read(getImageBgUseCase).call(place);
    } catch (e) {
      return null;
    }
  }

  Future<void> onSearchPlace(String query) async {
    try {
      final location = await ref.read(getPlaceByNameUseCase).call(query);
      final place = await getPlaceData(location, query);
      state = state.copyWith(
        searchPlace: place,
        searchQuery: query,
      );
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> onSavePlace(Place place) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final coords = prefs.getStringList('coords') ?? [];

      final doc = json.encode(
        {
          'lat': place.location!.latitude,
          'lon': place.location!.longitude,
          'name': place.name,
        },
      );
      coords.add(doc);

      await prefs.setStringList('coords', coords);
      state = state.copyWith(places: [...state.places, place]);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> cleanSearchPlace() async {
    state = state.copyWith(searchQuery: '');
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return Geolocator.getCurrentPosition();
  }
}

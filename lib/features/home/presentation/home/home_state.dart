// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/core/entities/place.dart';

class HomeState {
  final Place? searchPlace;
  final String? searchQuery;
  final Place? currentPlace;
  final List<Place> places;

  HomeState({
    this.searchPlace,
    this.searchQuery,
    this.currentPlace,
    this.places = const [],
  });

  HomeState copyWith({
    Place? searchPlace,
    String? searchQuery,
    Place? currentPlace,
    List<Place>? places,
  }) {
    return HomeState(
      searchPlace: searchPlace,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPlace: currentPlace ?? this.currentPlace,
      places: places ?? this.places,
    );
  }
}

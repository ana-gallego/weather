import 'package:flutter/material.dart';
import 'package:weather/core/entities/place.dart';
import 'package:weather/features/home/presentation/home/widgets/daily_advice.dart';
import 'package:weather/features/home/presentation/home/widgets/feels_like_section.dart';
import 'package:weather/features/home/presentation/home/widgets/forecast_list.dart';
import 'package:weather/features/home/presentation/home/widgets/place_background.dart';
import 'package:weather/features/home/presentation/home/widgets/temp_section.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    final weather = place.weather;

    return Stack(
      children: [
        PlaceBackground(place.imageUrl ?? ''),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TempSection(place: place),
              const SizedBox(height: 24),
              FeelsLikeSection(weather: weather),
              const SizedBox(height: 24),
              ForecastList(forecast: place.forecast ?? []),
              const SizedBox(height: 24),
              DailyAdvice(
                weatherElement: weather.weather!.first,
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ],
    );
  }
}

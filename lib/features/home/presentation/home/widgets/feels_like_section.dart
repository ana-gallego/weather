import 'package:flutter/material.dart';
import 'package:weather/core/design/atoms/app_text.dart';
import 'package:weather/core/entities/weather.dart';

class FeelsLikeSection extends StatelessWidget {
  const FeelsLikeSection({required this.weather, super.key});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            AppText(
              'Sensación',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            AppText(
              '${weather.main!.feelsLike!.round()}°',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Column(
          children: [
            AppText(
              'Viento',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            AppText(
              '${weather.wind!.speed!.round()} km/h',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Column(
          children: [
            AppText(
              'Humedad',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            AppText(
              '${weather.main!.humidity}%',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

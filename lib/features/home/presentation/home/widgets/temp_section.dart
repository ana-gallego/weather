import 'package:flutter/material.dart';
import 'package:weather/core/design/atoms/app_text.dart';
import 'package:weather/core/entities/place.dart';

class TempSection extends StatelessWidget {
  const TempSection({required this.place, super.key});
  final Place place;
  @override
  Widget build(BuildContext context) {
    final weather = place.weather;

    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              '${weather.main!.temp!.round()}°',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 80),
            ),
            AppText(
              place.name,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            AppText(
              '${weather.main!.tempMin}° min / ${weather.main!.tempMax}° max',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

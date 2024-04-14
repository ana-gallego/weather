import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/design/atoms/app_text.dart';
import 'package:weather/core/entities/weather.dart';
import 'package:weather/core/extensions/context_extension.dart';

class ForecastList extends StatelessWidget {
  ForecastList({required this.forecast, super.key});

  final List<Weather> forecast;

  @override
  Widget build(BuildContext context) {
    if (forecast.isEmpty) {
      return const SizedBox();
    }
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: forecast.map((f) {
          return _WeatherItem(item: f);
        }).toList(),
      ),
    );
  }
}

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({required this.item});
  final Weather item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: context.symetric(8, 12),
      margin: context.all(4),
      child: Column(
        children: [
          AppText(
            DateFormat.jm().format(item.date),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: context.vertical(12),
            child: SvgPicture.asset(
              'assets/icons/weather/ic_${item.weather!.first.icon}.svg',
              width: context.relative(50),
              height: context.relative(50),
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          AppText(
            '${item.main!.temp}°',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

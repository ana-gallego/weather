import 'package:flutter/material.dart';
import 'package:weather/core/design/atoms/app_text.dart';
import 'package:weather/core/entities/weather.dart';
import 'package:weather/gen/assets.gen.dart';

class DailyAdvice extends StatefulWidget {
  const DailyAdvice({required this.weatherElement, super.key});
  final WeatherElement weatherElement;

  @override
  State<DailyAdvice> createState() => _DailyAdviceState();
}

class _DailyAdviceState extends State<DailyAdvice> {
  @override
  Widget build(BuildContext context) {
    final main = widget.weatherElement.icon!.substring(0, 2);

    final advice = _advices[main]?['phrase'] ??
        'La naturaleza siempre tiene su encanto, solo hay que aprender a apreciarlo';
    final drink = _advices[main]?['drink'] ?? 'café';
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(
                '$advice o ¿Que tal disfrutar de un delicioso $drink?',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final _advices = {
  '01': {
    'phrase': '¡Un día perfecto para disfrutar del sol y recargar energías!',
    'drink': 'Mojito',
    'asset': Assets.images.mojito.path,
  },
  '02': {
    'phrase':
        'El sol se abre paso entre las nubes, ¡ideal para una caminata relajante!',
    'drink': 'Té helado',
    'asset': Assets.images.iceTea.path,
  },
  '03': {
    'phrase':
        'El cielo está jugando a esconderse y mostrarse, ¡perfecto para un paseo al aire libre!',
    'drink': 'Refresco de frutas',
    'asset': Assets.images.soda.path,
  },
  '04': {
    'phrase':
        'El cielo está pintado con pinceladas de nubes, ¡una vista única para contemplar!',
    'drink': 'Smoothie de frutas',
    'asset': Assets.images.smoothies.path,
  },
  '09': {
    'phrase':
        'La lluvia cae suavemente, ¡el momento ideal para relajarse con un buen libro!',
    'drink': 'Té caliente',
    'asset': Assets.images.coffeeCup.path,
  },
  '10': {
    'phrase':
        'El sonido de la lluvia calma el alma, ¡perfecto para una tarde de reflexión!',
    'drink': 'Café',
    'asset': Assets.images.coffee.path,
  },
  '11': {
    'phrase': 'El cielo ruge con fuerza, ¡qué espectáculo de la naturaleza!',
    'drink': 'Vino tinto',
    'asset': Assets.images.wineBottle.path,
  },
  '12': {
    'phrase':
        'El mundo se viste de blanco, ¡es tiempo de disfrutar de la magia invernal!',
    'drink': 'Chocolate caliente',
    'asset': Assets.images.hotChocolate.path,
  },
  '13': {
    'phrase':
        'La niebla envuelve el paisaje, ¡un aura misteriosa para explorar!',
    'drink': 'Té de hierbas caliente',
    'asset': Assets.images.coffeeCup.path,
  },
};

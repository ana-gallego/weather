// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:weather/core/design/atoms/app_text.dart';
import 'package:weather/core/design/atoms/buttons/app_button.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/features/home/presentation/home/home_controller.dart';
import 'package:weather/features/home/presentation/home/widgets/feels_like_section.dart';
import 'package:weather/features/home/presentation/home/widgets/forecast_list.dart';
import 'package:weather/features/home/presentation/home/widgets/place_background.dart';
import 'package:weather/features/home/presentation/home/widgets/temp_section.dart';

class SearchPlaceSection extends ConsumerStatefulWidget {
  const SearchPlaceSection({
    required this.showSavedPlace,
    super.key,
  });
  final void Function() showSavedPlace;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchPlaceControllerState();
}

class _SearchPlaceControllerState extends ConsumerState<SearchPlaceSection> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    return Stack(
      children: [
        PlaceBackground(
          state.searchPlace?.imageUrl ?? state.currentPlace?.imageUrl ?? '',
        ),
        SafeArea(
          child: Padding(
            padding: context.all(24),
            child: Column(
              children: [
                state.searchPlace != null
                    ? _PlaceTile(
                        place: state.searchQuery ?? '',
                        onClose: controller.cleanSearchPlace,
                      )
                    : SearchField(itmClick: controller.onSearchPlace),
                const SizedBox(height: 24),
                if (state.searchPlace != null)
                  Expanded(
                    child: Column(
                      children: [
                        TempSection(place: state.searchPlace!),
                        const SizedBox(height: 24),
                        FeelsLikeSection(weather: state.searchPlace!.weather),
                        const SizedBox(height: 24),
                        ForecastList(
                          forecast: state.searchPlace!.forecast ?? [],
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          text: 'Agregar a mi lista',
                          color: Colors.white54,
                          onPressed: () async {
                            await controller.onSavePlace(state.searchPlace!);
                            widget.showSavedPlace();
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PlaceTile extends StatelessWidget {
  const _PlaceTile({required this.place, required this.onClose});

  final String place;
  final void Function() onClose;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AppText(
            place,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(icon: const Icon(Icons.close), onPressed: onClose),
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    required this.itmClick,
    super.key,
  });

  final void Function(String x) itmClick;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final googleAPIKey = 'AIzaSyDV1hNyXVsVpuhBYcydrz7oI9Cu3bQA700';
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GooglePlacesAutoCompleteTextFormField(
      textEditingController: _textController,
      googleAPIKey: googleAPIKey,
      decoration: InputDecoration(
        hintText: 'Ingresa el nombre de un lugar...',
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.white),
        labelStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.white),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Debes ingresar un lugar';
        }
        return null;
      },
      maxLines: 1,
      overlayContainer: (child) => Material(
        elevation: 1,
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
      itmClick: (Prediction prediction) {
        _textController.text = prediction.description!;
        FocusScope.of(context).unfocus();
        widget.itmClick(prediction.description!);
      },
    );
  }
}

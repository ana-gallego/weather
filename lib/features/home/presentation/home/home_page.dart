import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context_extension.dart';
import 'package:weather/features/home/presentation/home/home_controller.dart';
import 'package:weather/features/home/presentation/home/widgets/place_details.dart';
import 'package:weather/features/home/presentation/home/widgets/search_place_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int page = 1;
  PageController pageController = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.read(homeControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);

    if (state.currentPlace == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (int i) => setState(() => page = i),
            children: [
              SearchPlaceSection(
                showSavedPlace: () {
                  pageController.animateToPage(
                    state.places.length + 2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              // Current place
              PlaceDetails(place: state.currentPlace!),
              // Saved places
              ...state.places.map((p) => PlaceDetails(place: p)),
            ],
          ),
          Positioned(
            bottom: 16,
            child: SizedBox(
              height: 50,
              width: context.width,
              child: page == 0
                  ? const SizedBox.shrink()
                  : DotsIndicator(
                      dotsCount: state.places.length + 1,
                      position: page - 1,
                      decorator: DotsDecorator(
                        activeSize: const Size(18, 9),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.white38,
                        activeColor: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

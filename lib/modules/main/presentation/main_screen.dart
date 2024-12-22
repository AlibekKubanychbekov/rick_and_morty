import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/episodes/episodes_body.dart';
import 'package:rick_and_morty/modules/error_body/error_body.dart';
import 'package:rick_and_morty/modules/home/presentation/home_screen.dart';
import 'package:rick_and_morty/modules/locations/locations_body.dart';
import 'package:rick_and_morty/modules/main/presentation/widgets/main_bottom_navigation.dart';
import 'package:rick_and_morty/modules/settings/settings_body.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _activeIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _activeIndex.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder(
          valueListenable: _activeIndex,
          builder: (context, value, child) => _buildeBody(_activeIndex.value),
        ),
      ),
      bottomNavigationBar: MainBottomNavigation(
        activeIndex: _activeIndex,
      ),
    );
  }
}

Widget _buildeBody(int index) {
  switch (index) {
    case 0:
      return const HomeBody();
    case 1:
      return const LocationsBody();
    case 2:
      return const EpisodesBody();
    case 3:
      return const SettingsBody();
    default:
      return const ErrorBody();
  }
}

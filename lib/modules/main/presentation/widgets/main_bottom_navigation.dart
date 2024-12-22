import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/assets/icons_assets.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/main/presentation/provider/theme_provider.dart';
import 'package:rick_and_morty/modules/main/presentation/widgets/main_bottom_navigation_item.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({required this.activeIndex, super.key});

  final ValueNotifier<int> activeIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: activeIndex,
        builder: (context, value, child) {
          return Container(
            color: context.watch<ThemeProvider>().currentThemeValue ==
                    AppThemeMode.dark
                ? AppColors.secondaryDark
                : AppColors.mainTextClr,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainBottomNavigationItem(
                  isActive: value == 0,
                  icon: IconsAssets.charactersIcon,
                  label: 'Characters',
                  onTap: () => activeIndex.value = 0,
                ),
                MainBottomNavigationItem(
                  isActive: value == 1,
                  icon: IconsAssets.locationsIcon,
                  label: 'Locations',
                  onTap: () => activeIndex.value = 1,
                ),
                MainBottomNavigationItem(
                  isActive: value == 2,
                  icon: IconsAssets.episodesIcon,
                  label: 'Episodes',
                  onTap: () => activeIndex.value = 2,
                ),
                MainBottomNavigationItem(
                  isActive: value == 3,
                  icon: IconsAssets.settingsIcon,
                  label: 'Settings',
                  onTap: () => activeIndex.value = 3,
                ),
              ],
            ),
          );
        });
  }
}

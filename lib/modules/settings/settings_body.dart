import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/app_router.gr.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/main/presentation/provider/theme_provider.dart';
import 'package:rick_and_morty/modules/settings/widgets/profile_widget.dart';

enum ThemeMode { dark, lihgt }

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  late ThemeProvider providerR = ThemeProvider();
  late ThemeProvider providerW = ThemeProvider();

  @override
  void didChangeDependencies() {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: ProfileWidget(
            onTap: () {
              context.router.push(
                const ProfileDetailsRoute(),
              );
            },
          ),
        ),
        Divider(
          thickness: 0.5,
          color: Colors.white.withValues(alpha: 0.2),
        ),
        const Text(
          'Theme view',
          style: TextStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                final themeValue =
                    ValueNotifier<AppThemeMode>(providerW.currentThemeValue);
                return ValueListenableBuilder(
                  valueListenable: themeValue,
                  builder: (context, value, child) {
                    return Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: themeValue.value == AppThemeMode.dark
                            ? AppColors.secondaryDark
                            : AppColors.mainTextClr,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              themeValue.value = AppThemeMode.dark;
                              providerR.applyDarkTheme();
                            },
                            child: ListTile(
                              title: Text(
                                'Dark',
                                style: TextStyle(
                                  color: context
                                              .watch<ThemeProvider>()
                                              .currentThemeValue ==
                                          AppThemeMode.dark
                                      ? AppColors.mainTextClr
                                          .withValues(alpha: 0.4)
                                      : AppColors.unSelectedClr,
                                ),
                              ),
                              leading: IconButton(
                                onPressed: () {},
                                icon: Icon(themeValue.value == AppThemeMode.dark
                                    ? Icons.radio_button_on_rounded
                                    : Icons.radio_button_off_rounded),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              themeValue.value = AppThemeMode.light;
                              providerR.applyLightTheme();
                            },
                            child: ListTile(
                              title: Text(
                                'Lihgt',
                                style: TextStyle(
                                  color: context
                                              .watch<ThemeProvider>()
                                              .currentThemeValue ==
                                          AppThemeMode.light
                                      ? AppColors.unSelectedClr
                                      : AppColors.mainTextClr
                                          .withValues(alpha: 0.4),
                                ),
                              ),
                              leading: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  themeValue.value == AppThemeMode.light
                                      ? Icons.radio_button_on_rounded
                                      : Icons.radio_button_off_rounded,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: ListTile(
            leading: Icon(
              Icons.color_lens_outlined,
              size: 40,
              color: context.watch<ThemeProvider>().currentThemeValue ==
                      AppThemeMode.dark
                  ? AppColors.mainTextClr
                  : AppColors.mainDark,
            ),
            title: Text(
              'Dark theme',
              style: TextStyle(
                color: context.watch<ThemeProvider>().currentThemeValue ==
                        AppThemeMode.dark
                    ? AppColors.mainTextClr
                    : AppColors.mainDark,
              ),
            ),
            subtitle: Text(context.watch<ThemeProvider>().currentThemeValue ==
                    AppThemeMode.dark
                ? 'On'
                : 'Off'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}

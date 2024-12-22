import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/main/presentation/provider/theme_provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    required this.onTap,
    super.key,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor:
                    context.watch<ThemeProvider>().currentThemeValue ==
                            AppThemeMode.dark
                        ? AppColors.mainTextClr.withOpacity(0.5)
                        : AppColors.unSelectedClr,
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aibek Kalykov',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rick',
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.buttonColor,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor:
                      context.watch<ThemeProvider>().currentThemeValue ==
                              AppThemeMode.dark
                          ? AppColors.mainDark
                          : AppColors.mainTextClr,
                  elevation: 0,
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(color: AppColors.buttonColor),
                )),
          )
        ],
      ),
    );
  }
}

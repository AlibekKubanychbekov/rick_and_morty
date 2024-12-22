import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/app_router.dart';
import 'package:rick_and_morty/modules/main/presentation/provider/theme_provider.dart';
import 'package:rick_and_morty/core/service/service_locator.dart' as get_it;

final di = GetIt.instance;

void main() {
  get_it.setup(di);
  final appRouter = AppRouter();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider()..applyDarkTheme(),
    child: RickAndMortyApp(
      router: appRouter,
    ),
  ));
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({required this.router, super.key});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: context.watch<ThemeProvider>().currentThemeData,
      routerConfig: router.config(),
    );
  }
}

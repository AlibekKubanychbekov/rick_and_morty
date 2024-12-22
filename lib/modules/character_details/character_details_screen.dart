import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/main/presentation/widgets/character_image_screen.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    required this.character,
    super.key,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CharacterImageScreen(
          character: character,
        ),
      ],
    ));
  }
}

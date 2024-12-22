import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

class CharacterImageScreen extends StatelessWidget {
  const CharacterImageScreen({
    required this.character,
    super.key,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 218,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(character.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6,
                  sigmaY: 6,
                ),
                child: Container(
                  color: AppColors.greyColor.withOpacity(0.1),
                  height: 218,
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainDark,
                    ),
                    child: Container(
                      height: 146,
                      width: 146,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(character.image),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    character.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    character.status,
                    style: TextStyle(
                        fontSize: 20,
                        color: (character.status) == 'Dead'
                            ? AppColors.deadColor
                            : AppColors.aliveColor),
                  )
                ],
              ),
            ),
            Positioned(
              height: 700,
              child: Column(
                children: [
                  Text(
                    character.species,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

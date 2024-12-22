// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:rick_and_morty/modules/character_details/character_details_screen.dart'
    as _i1;
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart'
    as _i5;
import 'package:rick_and_morty/modules/main/presentation/main_screen.dart'
    as _i2;
import 'package:rick_and_morty/modules/settings/profile_details.dart' as _i3;

/// generated route for
/// [_i1.CharacterDetailsScreen]
class CharacterDetailsRoute
    extends _i4.PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    required _i5.CharacterEntity character,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CharacterDetailsRoute.name,
          args: CharacterDetailsRouteArgs(
            character: character,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailsRouteArgs>();
      return _i1.CharacterDetailsScreen(
        character: args.character,
        key: args.key,
      );
    },
  );
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    required this.character,
    this.key,
  });

  final _i5.CharacterEntity character;

  final _i6.Key? key;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{character: $character, key: $key}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileDetailsScreen]
class ProfileDetailsRoute extends _i4.PageRouteInfo<void> {
  const ProfileDetailsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProfileDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileDetailsScreen();
    },
  );
}

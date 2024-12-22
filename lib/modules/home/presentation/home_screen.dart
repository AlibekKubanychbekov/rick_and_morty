import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/config/app_router.gr.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/main.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_state.dart';
// import 'package:rick_and_morty/modules/home/presentation/widgets/search_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _charactersBloc = di<CharactersBloc>()
    ..add(
      FetchCharactersEvent(),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _charactersBloc,
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state.status == StateStatus.success) {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
                itemCount: state.characters?.results.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.router.push(
                        CharacterDetailsRoute(
                          character: state.characters?.results[index] ??
                              CharacterEntity.empty(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  state.characters?.results[index].image ?? ''),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                state.characters?.results[index].status ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: (state.characters?.results[index]
                                                    .status ??
                                                '') ==
                                            'Dead'
                                        ? AppColors.deadColor
                                        : AppColors.aliveColor),
                              ),
                              Text(
                                state.characters?.results[index].name ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    state.characters?.results[index].species ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      state.characters?.results[index].gender ??
                                          '',
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.mainTextClr,
            ));
          },
        ),
      ),
    );
  }
}

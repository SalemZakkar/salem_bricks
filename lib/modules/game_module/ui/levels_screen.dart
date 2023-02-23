import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/game_module/bloc/game_bloc/game_bloc.dart';
import 'package:salem_brick/modules/game_module/routes.dart';
import 'package:salem_brick/modules/game_module/ui/game_screen.dart';

import '../../../shared/widget/button.dart';
import '../enums/level.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  GameBloc bloc = GameBloc();
  @override
  void initState() {
    bloc.add(GetTimes());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Levels",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  CButton(
                    width: 250,
                    height: 60,
                    child:
                        Text("Easy highScore:  ${state.easy.toString()} sec"),
                    onPressed: () {
                      Navigator.pushNamed(context, GameRoutes.gameScreen,
                          arguments:
                              const GameScreen(time: 10, level: Level.easy));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CButton(
                    width: 250,
                    height: 60,
                    child:
                        Text("Medium highScore: ${state.mid.toString()} sec"),
                    onPressed: () {
                      Navigator.pushNamed(context, GameRoutes.gameScreen,
                          arguments:
                              const GameScreen(time: 7, level: Level.medium));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CButton(
                    width: 250,
                    height: 60,
                    child: Text("Hard highScore: ${state.hard.toString()} sec"),
                    onPressed: () {
                      Navigator.pushNamed(context, GameRoutes.gameScreen,
                          arguments:
                              const GameScreen(time: 5, level: Level.hard));
                    },
                  )
                ],
              ),
            ),
          );
        },
        bloc: bloc,
      ),
    );
  }
}

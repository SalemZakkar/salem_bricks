import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/game_module/routes.dart';
import 'package:salem_brick/modules/home_module/bloc/home_bloc.dart';
import 'package:salem_brick/modules/theme_module/routes.dart';
import '../../../shared/widget/button.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  HomeBloc bloc = HomeBloc();
  bool soundMode = true;
  @override
  void initState() {
    bloc.add(GetSoundModeEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.soundMode != null) {
                setState(() {
                  soundMode = state.soundMode!;
                });
              }
            },
          )
        ],
        child: Scaffold(
          // appBar: AppBar(),
          body: Container(
            //  constraints: const BoxConstraints.expand(),
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
                    "Brick Fights",
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.play_arrow_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Play",
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, GameRoutes.levelsScreen);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CButton(
                    width: 250,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(CupertinoIcons.paintbrush),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Theme",
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ThemeRoutes.themesPage);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CButton(
                    width: 250,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(soundMode
                            ? CupertinoIcons.speaker
                            : CupertinoIcons.speaker_slash),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          soundMode ? "Sounds: on" : "Sounds: off",
                        )
                      ],
                    ),
                    onPressed: () {
                      bloc.add(SetSoundModeEvent(mode: !soundMode));
                      bloc.add(GetSoundModeEvent());
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

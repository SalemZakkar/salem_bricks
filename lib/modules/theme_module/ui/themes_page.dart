import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/theme_module/bloc/themes_bloc.dart';
import 'package:salem_brick/modules/theme_module/models/theme_model.dart';
import 'package:salem_brick/modules/theme_module/ui/widget/theme_card.dart';

import '../themes/black_theme.dart';
import '../themes/blues_theme.dart';
import '../themes/red_theme.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  ThemesBloc bloc = ThemesBloc();
  int id = 0;

  @override
  void initState() {
    bloc.add(GetThemeEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<GameTheme> themes = [
      GameTheme(name: "Blue", theme: blue, id: 0),
      GameTheme(name: "Red", theme: red, id: 1),
      GameTheme(name: "Black", theme: black, id: 2),
    ];
    return MultiBlocListener(
        listeners: [
          BlocListener<ThemesBloc, ThemesState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.id != null) {
                id = state.id!;
              }
            },
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Themes"),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ThemeCard(
                      theme: themes[index],
                    ),
                  );
                },
                itemCount: themes.length,
              )),
        ));
  }
}

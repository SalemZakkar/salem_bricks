import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/config/app_router.dart';
import 'package:salem_brick/modules/home_module/routes.dart';
import 'package:salem_brick/modules/theme_module/bloc/themes_bloc.dart';
import 'package:salem_brick/modules/theme_module/storage/theme_storage.dart';
import 'package:salem_brick/modules/theme_module/themes/black_theme.dart';
import 'package:salem_brick/modules/theme_module/themes/blues_theme.dart';
import 'package:salem_brick/shared/shared_bloc/shared_bloc.dart';

import 'modules/theme_module/themes/red_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<SharedBloc>(
      create: (context) => SharedBloc(),
    )
  ], child: const Main()));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<ThemeData> themes = [blue, red, black];
  int theme = 0;
  ThemesBloc themesBloc = ThemesBloc();

  @override
  void initState() {
    themesBloc.add(GetThemeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SharedBloc, SharedState>(
          listener: (context, state) async {
            if (state is RefreshThemeState) {
              theme = await ThemeStorage.getTheme();
              setState(() {});
            }
          },
        ),
        BlocListener<ThemesBloc, ThemesState>(
          bloc: themesBloc,
          listener: (context, state) async {
            if (state.id != null) {
              theme = state.id!;
              setState(() {});
            }
          },
        )
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: themes[theme],
        initialRoute: HomeRoutes.startScreen,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

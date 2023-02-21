import 'package:flutter/material.dart';
import 'package:salem_brick/modules/game_module/routes.dart';
import 'package:salem_brick/modules/game_module/ui/game_screen.dart';
import 'package:salem_brick/modules/home_module/routes.dart';
import 'package:salem_brick/modules/game_module/ui/levels_screen.dart';
import 'package:salem_brick/modules/home_module/ui/start_screen.dart';
import 'package:salem_brick/modules/theme_module/routes.dart';
import 'package:salem_brick/modules/theme_module/ui/themes_page.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoutes.startScreen:
        return MaterialPageRoute(builder: (context) => const StartPage());
      case ThemeRoutes.themesPage:
        return MaterialPageRoute(builder: (context) => const ThemesPage());
      case GameRoutes.levelsScreen:
        return MaterialPageRoute(builder: (context) => const LevelsScreen());
      case GameRoutes.gameScreen:
        return MaterialPageRoute(builder: (context) => const GameScreen());
      default:
        return null;
    }
  }
}

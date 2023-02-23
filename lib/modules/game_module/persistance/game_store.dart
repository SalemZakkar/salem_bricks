import 'dart:math';

import 'package:salem_brick/modules/game_module/enums/level.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameStore {
  void save(Level level, int sec) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(level.toString(),
        max(sec, sharedPreferences.getInt(level.toString()) ?? 0));
  }

  Future<int> get(Level level) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   print('get ' + level.toString().split(".").last + " " + sharedPreferences.getInt(level.toString()).toString() );
    return sharedPreferences.getInt(level.toString()) ?? -1;
  }
}

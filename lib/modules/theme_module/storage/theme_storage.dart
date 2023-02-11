import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  static String themeKey = "theme";

  static Future<void> setTheme(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("set Theme to $id");
    debugPrint(
        "-------------------------------------------------------------------------------------------");
    await sharedPreferences.setInt(themeKey, id);
  }

  static Future<int> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id = (sharedPreferences.getInt(themeKey)) ?? 0;
    debugPrint("Theme is $id");
    debugPrint(
        "-------------------------------------------------------------------------------------------");
    return id;
  }
}

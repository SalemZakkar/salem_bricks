import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeStorage {
  static const String soundModeKey = "sound_mode";

  static Future<void> setSoundMode(bool mode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(soundModeKey, mode);
    debugPrint("Set sound mode to $mode");
    debugPrint(
        "----------------------------------------------------------------");
  }

  static Future<bool> getSoundMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool mode = (sharedPreferences.getBool(soundModeKey)) ?? true;
    debugPrint("sound mode is $mode");
    debugPrint(
        "----------------------------------------------------------------");
    return mode;
  }
}

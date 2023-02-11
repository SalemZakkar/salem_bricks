import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:salem_brick/modules/home_module/storage/home_storage.dart';

class AudioService {
  static Future<void> playSound(String soundPath) async {
    try {
      if (await HomeStorage.getSoundMode()) {
        AudioPlayer player = AudioPlayer();
        await player.play(AssetSource(soundPath));
      }
      debugPrint("Played Sound $soundPath");
      debugPrint(
          "-------------------------------------------------------------------------------------------------------");
    } catch (e) {
      debugPrint("Error Play Sound $soundPath");
      debugPrint(e.toString());
      debugPrint(
          "-------------------------------------------------------------------------------------------------------");
    }
  }
}

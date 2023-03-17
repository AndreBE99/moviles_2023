import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;

  void initializeVideoPlayer(String filePath) async {
    // TODO: inicializar el video player
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((value) {
        notifyListeners();
      });
  }

  // TODO: cargar datos
  Future<void> loadConfigs() async {
    var _configBox = await Hive.openBox<int>("vidConfigs");

    if (_vCont != null) {
      int milis = _configBox.get("video_time") ?? 0;
      Duration position = Duration(milliseconds: milis);
      await _vCont!.seekTo(position);
      await _vCont!.setVolume(1);
    }
    notifyListeners();
  }

  // TODO: guardar datos
  Future<void> saveConfigs() async {
    var _configBox = await Hive.openBox<int>("vidConfigs");
    try {
      int position = _vCont!.value.position.inMilliseconds;
      await _configBox.put("video_time", position);
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: ${e}");
      isSaved = false;
      notifyListeners();
    }
  }

  void isPlaying(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }
}

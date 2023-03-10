// ignore_for_file: unnecessary_import, unused_element, todo, unused_local_variable

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class MyDownloadProvider with ChangeNotifier {
  String? videoPath;
  bool? isPermissionGranted;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  Future<void> descargarVideo() async {
    // TODO: hacer el metodo para descargar video
    try {
      isLoading = true;
      notifyListeners();
      var res = await get(Uri.parse(videoUrl));
      if (res.statusCode == 200) {
        await _saveFile(res.bodyBytes);
      }
    } catch (e) {
      print("Error al Descargarse: $e");
      isSavedSuccess = false;
      notifyListeners();
    }
  }

  Future<bool> _requestStoragePermission() async {
    var permiso = await Permission.storage.status;
    if (permiso == PermissionStatus.denied) {
      await Permission.storage.request();
    }
    return permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(Uint8List _content) async {
    // revisar si tenemos permiso
    if (!await _requestStoragePermission()) {
      isPermissionGranted = false;
      notifyListeners();
      return;
    }

    // acceso al storage solo android
    var dir = await getExternalStorageDirectory();
    // crear y escribir archivo
    videoPath = "${dir!.path}/${videoName}.mp4";
    File file = File(videoPath!);
    await file.writeAsBytes(_content);
    isSavedSuccess = true;
    isLoading = false;
    notifyListeners();
  }
}

import 'package:bibliobook/providers/choose_picture_provider.dart';
import 'package:bibliobook/providers/record_audio_provider.dart';
import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  static final NotesProvider _notesProvider = NotesProvider._internal();
  factory NotesProvider() {
    return _notesProvider;
  }
  NotesProvider._internal();

  final pictProvider = ChoosePictureProvider();
  final audioProvider = RecordAudioProvider();
  var urlCtrl = TextEditingController();
  var titleCtrl = TextEditingController();
  var descCtrl = TextEditingController();

  void clearForm() {
    pictProvider.borrarImagen();
    audioProvider.audioFile = null;
    urlCtrl.clear();
    titleCtrl.clear();
    descCtrl.clear();
    notifyListeners();
  }
}
// TODO: implemente metodo para borrar formulario
// TODO: implemente metodo para borrar archivo de audio
// TODO: implementar el guardado de datos en Cloud Firestore
// TODO: implementar guardado de imagenes/audios en Cloud Storage
// TODO: cambie el app icon a un icono mas bonito
// TODO: renombre la app
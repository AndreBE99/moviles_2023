import 'package:bibliobook/providers/choose_picture_provider.dart';
import 'package:bibliobook/providers/record_audio_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future guardarNotasLibros() async {
    try {
      Map<String, dynamic> dataToSave = {};
      String imgUrl = await _uploadFileToStorage();
      if (imgUrl == "") return;
      dataToSave = {
        "publishedAt": Timestamp.fromDate(DateTime.now()),
        "audio": audioProvider.file64,
        "img": imgUrl,
        "titulo": titleCtrl.text,
        "url": urlCtrl.text,
        "descripcion": descCtrl.text
      };
      // guardar en firestore
      await FirebaseFirestore.instance
          .collection("biblio-books")
          .add(dataToSave);
      notifyListeners();
    } catch (e) {
      print("Error al crear documento Firestore: ${e.toString()}");
    }
  }

  Future<String> _uploadFileToStorage() async {
    try {
      if (pictProvider.getPicture == null) return "";
      var _stamp = DateTime.now();
      // definir la upload task
      UploadTask _task = FirebaseStorage.instance
          .ref("libros/imagen_${_stamp}.png")
          .putFile(pictProvider.getPicture!);
      // ejecutar la task
      await _task;
      // recuperar la url del archivo
      return await _task.storage
          .ref("libros/imagen_${_stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print("Error al subir el archivo a Cloud Storage: ${e.toString()}");
      return "";
    }
  }
}
// TODO: implemente metodo para borrar formulario
// TODO: implemente metodo para borrar archivo de audio
// TODO: implementar el guardado de datos en Cloud Firestore
// TODO: implementar guardado de imagenes/audios en Cloud Storage
// TODO: cambie el app icon a un icono mas bonito
// TODO: renombre la app
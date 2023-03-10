import 'package:flutter/material.dart';
import 'package:video_downlad/providers/my_download_provider.dart';

class ShowText extends StatelessWidget {
  const ShowText({
    super.key,
    required this.provider,
  });

  final MyDownloadProvider provider;

  @override
  Widget build(BuildContext context) {
    if (provider.videoPath != null) {
      return Text("Path: ${provider.videoPath}");
    } else {
      if (provider.isPermissionGranted!) {
        return Text("Se requieren permisos de almacenamiento.");
      } else if (provider.isSavedSuccess!) {
        return Text("Error al descargar el archivo");
      } else {
        return Text("Haga click en descargar");
      }
    }
  }
}

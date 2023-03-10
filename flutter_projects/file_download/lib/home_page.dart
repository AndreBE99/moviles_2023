// ignore_for_file: unused_element, todo

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downlad/providers/my_download_provider.dart';
import 'package:video_downlad/widgets/loading.dart';
import 'package:video_downlad/widgets/showText.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select an option'),
      ),
      body: Consumer<MyDownloadProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: ShowLoading(
                    provider: provider,
                  ),
                ),
              ),
              MaterialButton(
                child: Text("Descargar"),
                onPressed: () {
                  provider.descargarVideo();
                },
              ),
              MaterialButton(child: Text("Ver video"), onPressed: () {}),
              MaterialButton(child: Text("Borrar video"), onPressed: () {}),
              ShowText(provider: provider)
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_downlad/providers/my_download_provider.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({
    super.key,
    required this.provider,
  });

  final MyDownloadProvider provider;

  @override
  Widget build(BuildContext context) {
    if (provider.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Container();
    }
  }
}

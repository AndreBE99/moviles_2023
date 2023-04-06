import 'package:flutter/material.dart';
import 'package:themed_app/home/home_page.dart';

void main() {
  // TODO: BLoC provider con socope para poder cambiar themes en toda la app
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: BLoC builder para cambiar theme de la Material App
    return MaterialApp(
      title: 'Change Themes App',
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Happy Birthday Frank',
                  style: TextStyle(fontSize: 24, color: Colors.red)),
              Expanded(
                child: Image.network(
                    'https://s3.envato.com/files/327170974/IMG_7720.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('From Mike'),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

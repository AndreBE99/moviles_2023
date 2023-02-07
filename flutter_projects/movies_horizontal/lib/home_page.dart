import 'package:flutter/material.dart';
import 'package:movies_horizontal/item_movie.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(
            children: [
              Text("Selecciona tu película"),
              SizedBox(height: 24),
              Container(
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _listElements.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemMovie(
                        titulo: _listElements[index]["title"]!,
                        descripcion: _listElements[index]["description"]!,
                        image: _listElements[index]["image"]!,
                      );
                    }),
              ),
            ],
          )),
    );
  }
}

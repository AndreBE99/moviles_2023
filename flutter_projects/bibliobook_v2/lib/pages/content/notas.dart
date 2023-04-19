import 'package:flutter/material.dart';

import 'crear_notas.dart';

class Notas extends StatefulWidget {
  const Notas({Key? key}) : super(key: key);

  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  final List<String> _notas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _notas.length,
        itemBuilder: (context, index) {
          final nota = _notas[index];
          return ListTile(
            title: Text(nota),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CrearNota(),
            ),
          ).then((nota) {
            if (nota != null) {
              setState(() {
                _notas.add(nota);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

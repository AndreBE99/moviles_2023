import 'package:flutter/material.dart';

class ItemMovie extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String image;

  ItemMovie(
      {super.key,
      required this.titulo,
      required this.descripcion,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Seleccion guardada"),
            content: Text("Se ha seleccionado el elemento: ${titulo}"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(children: [
            Positioned.fill(
                child: Image.network(
              "${image}",
              fit: BoxFit.fill,
            )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text("${titulo}"), Text("${descripcion}")],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

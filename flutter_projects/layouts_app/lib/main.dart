import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ListView(
          children: [
            Image.network(
              'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg',
            ),
            ListTile(
              title: Text("El ITESO, Universidad Jesuita de Guadalajara"),
              subtitle: Text("Periférico Sur 8585"),
              trailing: Wrap(children: [
                IconButton(
                    color: tap ? Colors.indigo : Colors.black54,
                    onPressed: () {
                      counter++;
                      tap = !tap;
                      setState(() {});
                    },
                    icon: Icon(Icons.thumb_up)),
                Text("$counter")
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Icon(Icons.mail),
                        )),
                    Text("Correo"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Icon(Icons.phone),
                        )),
                    Text("Llamada"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(1),
                        child: IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Icon(Icons.directions),
                        )),
                    Text("Ruta"),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México.",
                  textAlign: TextAlign.justify),
            )
          ],
        ),
      ),
    );
  }
}

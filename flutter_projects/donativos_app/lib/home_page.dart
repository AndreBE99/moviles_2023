import 'package:flutter/material.dart';

import 'second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: TextButton(
            child: Text("Ir a Page 2"),
            onPressed: () async {
              var dato = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SecondPage(),
              ));
              print(dato);
              // Navigator.of(context).pushNamed("/second");
            }),
      ),
    );
  }
}

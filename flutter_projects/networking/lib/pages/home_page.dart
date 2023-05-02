import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            child: Text("Leer posts"),
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            child: Text("Crear nuevo post"),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:forage/forage_page.dart';
import 'package:forage/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = context.watch<ItemList>();

    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: ListView.builder(
        itemCount: itemList.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList.items[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Forage(),
            ));
          }),
    );
  }
}

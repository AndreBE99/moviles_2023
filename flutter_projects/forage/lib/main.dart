import 'package:flutter/material.dart';
import 'package:forage/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemList(),
      child: MaterialApp(
        title: 'My App',
        home: HomePage(),
      ),
    );
  }
}

class ItemList with ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
}

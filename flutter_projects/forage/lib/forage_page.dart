import 'package:flutter/material.dart';
import 'package:forage/home_page.dart';
import 'package:forage/main.dart';
import 'package:provider/provider.dart';

class Forage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _itemController1 = TextEditingController();
  final _itemController2 = TextEditingController();
  final _itemController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _itemController1,
              decoration: InputDecoration(labelText: 'Item 1'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _itemController2,
              decoration: InputDecoration(labelText: 'Item 2'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _itemController3,
              decoration: InputDecoration(labelText: 'Item 3'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final itemList = context.read<ItemList>();
                  itemList.addItem(
                      '${_itemController1.text}, ${_itemController2.text}, ${_itemController3.text}');
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

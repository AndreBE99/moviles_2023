import 'package:counter_hive/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador con persistencia"),
      ),
      body: Consumer<CounterProvider>(builder: (context, provider, _) {
        return ListView(
          children: [
            Text(
              "${provider.getCounter}",
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 200,
            ),
            SwitchListTile(
              title: Text("Hacer algo"),
              value: provider.switchVal,
              onChanged: (value) {
                provider.setSwitch(value);
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                provider.saveCounter();
              },
              icon: Icon(Icons.save),
              label: Text("Guardar"),
            ),
            OutlinedButton.icon(
              onPressed: () {
                provider.loadCounter();
              },
              icon: Icon(Icons.upload),
              label: Text("Cargar"),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

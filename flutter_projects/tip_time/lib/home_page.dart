import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/providers/tip_time_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Column(
            children: context
                .read<TipTimeProvider>()
                .radioGroupValues
                .entries
                .map(
                  (e) => ListTile(
                    leading: Radio(
                      value: e.key,
                      groupValue:
                          context.watch<TipTimeProvider>().getSelectedRadio,
                      onChanged: (newvalue) {
                        //llama el metodo para settear selectedRadio.
                        //context.read para llamar metodos
                        //context .watch para observar variables
                        context
                            .read<TipTimeProvider>()
                            .setSelectedRadio(newvalue);
                      },
                    ),
                    title: Text(e.value),
                  ),
                )
                .toList(),
          ),
          SwitchListTile(
            secondary: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            value: context.watch<TipTimeProvider>().isSelected,
            onChanged: (newVal) {
              context.read<TipTimeProvider>().setIsSelected(newVal);
            },
          ),
          MaterialButton(
            child: Text("CALCULATE"),
            onPressed: () {
              context.read<TipTimeProvider>().tipcalculation(23244);
            },
          ),
          Text(
            "Tip amount: \$20.00",
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

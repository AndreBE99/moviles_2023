import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is JuanState) {
            return Center(
              child: Text("${state.counter}"),
            );
          } else {
            return Center(
              child: Text("Indique una opción"),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: "Aumentar contador",
            child: Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
          ),
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: "Decrementar contador",
            child: Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
          ),
          FloatingActionButton(
            key: UniqueKey(),
            tooltip: "Reiniciar contador",
            child: Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ResetEvent());
            },
          ),
        ],
      ),
    );
  }
}

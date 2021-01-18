import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/cubit/countercubit_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Valor do counter tela 2",
              textScaleFactor: 2,
            ),
            BlocBuilder<CountercubitCubit, CounterState>(
                builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              );
            }),
            MaterialButton(
                child: Text("Third Screen"),
                color: color,
                onPressed: () => Navigator.of(context).pushNamed('/third'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CountercubitCubit>().increment(),
            tooltip: 'Increment',
            heroTag: "one",
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CountercubitCubit>().decrement(),
            tooltip: 'Decrement',
            heroTag: "two",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

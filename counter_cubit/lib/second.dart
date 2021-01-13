import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit/countercubit_cubit.dart';

class SecondScreen extends StatelessWidget {
  final BuildContext oldContext;
  const SecondScreen({
    Key key,
    this.oldContext,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CountercubitCubit>(oldContext),
      child: Scaffold(
          appBar: AppBar(),
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
                })
              ],
            ),
          )),
    );
  }
}

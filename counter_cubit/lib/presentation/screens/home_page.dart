import 'package:counter_cubit/constants/enums.dart';
import 'package:counter_cubit/logic/cubits/cubit/countercubit_cubit.dart';
import 'package:counter_cubit/logic/cubits/cubit/internet_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'second.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubitCubit, InternetCubitState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          context.read<CountercubitCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          context.read<CountercubitCubit>().increment();
        } else if (state is InternetDisconnected) {
          context.read<CountercubitCubit>().decrement();
        } else {}
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
          actions: [
            IconButton(
                icon: Icon(Icons.next_plan),
                onPressed: () => Navigator.of(context).pushNamed('/second'))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              // BlocBuilder<InternetCubitCubit, InternetCubitState>(
              //     builder: (context, state) {
              //   if (state is InternetConnected &&
              //       state.connectionType == ConnectionType.Wifi) {
              //     return Text("Wifi");
              //   } else if (state is InternetConnected &&
              //       state.connectionType == ConnectionType.Mobile) {
              //     return Text("Mobile");
              //   } else if (state is InternetDisconnected) {
              //     return Text("Disconnected");
              //   } else {
              //     return CircularProgressIndicator();
              //   }
              // }),
              BlocConsumer<CountercubitCubit, CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state.wasIncremented) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Yaay incremented to ${state.counterValue}"),
                    ));
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Valor do Counter',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${state.counterValue}',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        //     floatingActionButton: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         FloatingActionButton(
        //           onPressed: () => context.read<CountercubitCubit>().increment(),
        //           tooltip: 'Increment',
        //           heroTag: "one",
        //           child: Icon(Icons.add),
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //         FloatingActionButton(
        //           onPressed: () => context.read<CountercubitCubit>().decrement(),
        //           tooltip: 'Decrement',
        //           heroTag: "two",
        //           child: Icon(Icons.remove),
        //         ),
        //   ],
        // ),
      ),
    );
  }
}

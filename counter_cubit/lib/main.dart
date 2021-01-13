import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit/countercubit_cubit.dart';
import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountercubitCubit>(
        create: (context) => CountercubitCubit(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen(
                        oldContext: context,
                      ))))
        ],
      ),
      body: BlocConsumer<CountercubitCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.wasIncremented) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Yaay incremented to ${state.counterValue}"),
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

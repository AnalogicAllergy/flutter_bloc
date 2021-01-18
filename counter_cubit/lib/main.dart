import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubits/cubit/countercubit_cubit.dart';
import 'logic/cubits/cubit/internet_cubit_cubit.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/second.dart';
import 'presentation/screens/third.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({Key key, @required this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubitCubit>(
          create: (context) => InternetCubitCubit(connectivity: connectivity),
        ),
        BlocProvider<CountercubitCubit>(
          create: (context) => CountercubitCubit(
              internetCubit: context.read<InternetCubitCubit>()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
              value: context.watch<CountercubitCubit>(),
              child: MyHomePage(title: "Home Screen", color: Colors.blueGrey)),
          '/second': (context) => BlocProvider.value(
                value: context.watch<CountercubitCubit>(),
                child: SecondScreen(
                  title: "Second Screen",
                  color: Colors.redAccent,
                ),
              ),
          '/third': (context) => BlocProvider.value(
                value: context.watch<CountercubitCubit>(),
                child: ThirdScreen(
                  title: "Third Screen",
                  color: Colors.purpleAccent,
                ),
              ),
        },
      ),
    );
  }
}

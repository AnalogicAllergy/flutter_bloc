import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_cubit/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'internet_cubit_cubit.dart';

part 'countercubit_state.dart';

class CountercubitCubit extends Cubit<CounterState> {
  final InternetCubitCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CountercubitCubit({this.internetCubit, int initialState: 0})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        increment();
      } else if (internetState is InternetDisconnected) {
        decrement();
      }
    });
  }
  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}

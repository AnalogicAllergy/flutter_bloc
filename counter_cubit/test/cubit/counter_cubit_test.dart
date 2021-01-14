import 'package:counter_cubit/cubits/cubit/countercubit_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group("Counter cubit", () {
    CountercubitCubit counterCubit;

    setUp(() {
      counterCubit = new CountercubitCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    //test

    test("the initial state is CounterState(counterValue:0)", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });
    blocTest(
        "the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called",
        build: () => CountercubitCubit(),
        act: (cubit) => cubit.increment(),
        expect: [CounterState(counterValue: 1, wasIncremented: true)]);
    blocTest(
        "the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called",
        build: () => CountercubitCubit(),
        act: (cubit) => cubit.decrement(),
        expect: [CounterState(counterValue: -1, wasIncremented: false)]);
  });
}

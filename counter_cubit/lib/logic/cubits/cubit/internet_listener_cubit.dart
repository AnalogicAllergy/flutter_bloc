import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_listener_state.dart';

class InternetListenerCubit extends Cubit<InternetListenerState> {
  InternetListenerCubit() : super(InternetListenerInitial());
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(register: false)) {
    on<UserRegisterEvent>((event, emit) {
      // TODO: implement event handler
      emit(UserState(register: event.value));
    });
    on<LoadUserEvent>((event, emit) {
      // TODO: implement event handler
      emit(UserState(user: event.value));
    });
  }
}

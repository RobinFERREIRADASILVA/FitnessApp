part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterEvent extends UserEvent {
  final dynamic value;

  UserRegisterEvent(this.value);
}

class LoadUserEvent extends UserEvent {
  final dynamic value;

  LoadUserEvent(this.value);
}

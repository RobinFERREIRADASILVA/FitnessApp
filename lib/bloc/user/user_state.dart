part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {
  const UserInitialState({
    this.register,
    this.user,
  });

  final register;
  final user;

  @override
  List<Object> get props => [
        register,
        user,
      ];
}

part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {
  const UserInitialState({
    required this.register,
  });

  final bool register;

  @override
  List<Object> get props => [
        register,
      ];
}

class UserDatasState extends UserState {
  const UserDatasState({
    required this.user,
  });

  final Object user;

  @override
  List<Object> get props => [
        user,
      ];
}

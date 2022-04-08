part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {
  final bool register;

  const UserInitialState({
    required this.register,
  });

  @override
  List<Object> get props => [
        register,
      ];
}

part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final int userId;
  const RegisterLoaded(this.userId);
  @override
  List<Object> get props => [userId];
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError({@required this.message});
  @override
  List<Object> get props => [message];
}

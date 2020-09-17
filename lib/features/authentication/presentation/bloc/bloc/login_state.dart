part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class Empty extends LoginState {
  const Empty();
}

class Loading extends LoginState {
  const Loading();
}

class Loaded extends LoginState {
  final LoginResponse loginResponse;
  const Loaded({@required this.loginResponse});
  @override
  List<Object> get props => [loginResponse];
}

class Error extends LoginState {
  final String message;
  const Error({@required this.message});
  @override
  List<Object> get props => [message];
}

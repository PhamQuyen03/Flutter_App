part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SendLoginRequestEvent extends LoginEvent {
  final String phoneNumber;
  final String password;

  SendLoginRequestEvent(this.phoneNumber, this.password);

  @override
  List<Object> get props => [phoneNumber, password];
}

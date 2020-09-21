part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterCheckPhoneNumberEvent extends RegisterEvent {
  final String phoneNumber;
  RegisterCheckPhoneNumberEvent(this.phoneNumber);
  @override
  List<Object> get props => [phoneNumber];
}

class SendRegisterRequestEvent extends RegisterEvent {
  final String phoneNumber;
  final String password;
  final String fullName;
  final String email;
  SendRegisterRequestEvent(
      {this.phoneNumber, this.password, this.fullName, this.email});

  @override
  List<Object> get props => [phoneNumber, password, fullName];
}

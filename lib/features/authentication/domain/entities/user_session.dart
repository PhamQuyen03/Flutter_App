import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  UserSession({this.id, this.fullName, this.phoneNumber});
  final int id;
  final String fullName;
  final String phoneNumber;

  @override
  // TODO: implement props
  List<Object> get props => [id, fullName, phoneNumber];
}

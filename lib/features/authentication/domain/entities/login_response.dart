import 'package:equatable/equatable.dart';
import 'package:flutter_app/features/authentication/domain/entities/user_session.dart';

class LoginResponse extends Equatable {
  LoginResponse(
      {this.sessionId, this.accessToken, this.refreshToken, this.user});
  final String sessionId;
  final String accessToken;
  final String refreshToken;
  final UserSession user;
  @override
  // TODO: implement props
  List<Object> get props => [sessionId, accessToken, refreshToken, user];
}

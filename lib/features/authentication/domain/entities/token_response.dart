import 'package:equatable/equatable.dart';

class TokenResponse extends Equatable {
  TokenResponse({this.sessionId, this.accessToken, this.refreshToken});
  final String sessionId;
  final String accessToken;
  final String refreshToken;
  @override
  // TODO: implement props
  List<Object> get props => [sessionId, accessToken, refreshToken];
}

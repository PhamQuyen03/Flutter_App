import 'package:flutter/material.dart';

import '../../domain/entities/login_response.dart';
import 'user_session_model.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel(
      {@required String sessionId,
      @required String accessToken,
      @required String refreshToken,
      @required UserSessionModel user})
      : super(
            sessionId: sessionId,
            accessToken: accessToken,
            refreshToken: refreshToken,
            user: user);
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      sessionId: json["sessionId"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      user: UserSessionModel.fromJson(json["user"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user
    };
  }
}

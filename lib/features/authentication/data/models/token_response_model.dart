import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/domain/entities/token_response.dart';

class TokenResponseModel extends TokenResponse {
  TokenResponseModel({
    @required sessionId,
    @required accessToken,
    @required refreshToken,
  }) : super(
          sessionId: sessionId,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return TokenResponseModel(
      sessionId: json["sessionId"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}

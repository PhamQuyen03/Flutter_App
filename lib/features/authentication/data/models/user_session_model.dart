import 'package:flutter/material.dart';

import '../../domain/entities/user_session.dart';

class UserSessionModel extends UserSession {
  UserSessionModel(
      {@required int id,
      @required String fullName,
      @required String phoneNumber})
      : super(id: id, fullName: fullName, phoneNumber: phoneNumber);
  factory UserSessionModel.fromJson(Map<String, dynamic> json) {
    return UserSessionModel(
        id: (json["id"] as num).toInt(),
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"]);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'fullName': fullName, 'phoneNumber': phoneNumber};
  }
}

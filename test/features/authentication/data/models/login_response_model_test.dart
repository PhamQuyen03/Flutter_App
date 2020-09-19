import 'dart:convert';
import 'package:flutter_app/features/authentication/data/models/login_response_model.dart';
import 'package:flutter_app/features/authentication/data/models/user_session_model.dart';
import 'package:flutter_app/features/authentication/domain/entities/login_response.dart';
import 'package:flutter_app/features/authentication/domain/entities/user_session.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserSessionModel = UserSessionModel(
      id: 1, phoneNumber: "0338004227", fullName: "Quản trị viên");
  final tLoginResponseModel = LoginResponseModel(
    sessionId: "5PxhZ2O8",
    accessToken: "token_string",
    refreshToken: "04043c74-d079-4110-9db6-7284fbcda6fd",
    user: tUserSessionModel,
  );
  test('Should be a subclass of LoginResponse entity', () async {
    //assert
    expect(tLoginResponseModel, isA<LoginResponse>());
  });
  group('fromJson', () {
    test('should return a valid model when success', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('authentication/login_response.json'));
      //act
      final result = LoginResponseModel.fromJson(jsonMap);
      //assert
      expect(result, tLoginResponseModel);
    });
  });

  group('toJson', () {
    test('should return a valid json map', () async {
      //act
      final result = tLoginResponseModel.toJson();
      final expectResult = {
        "sessionId": "5PxhZ2O8",
        "accessToken": "token_string",
        "refreshToken": "04043c74-d079-4110-9db6-7284fbcda6fd",
        "user": {
          "id": 1,
          "fullName": "Quản trị viên",
          "phoneNumber": "0338004227"
        }
      };
      //assert
      expect(result, expectResult);
    });
  });
}

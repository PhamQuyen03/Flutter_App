import 'dart:convert';

import 'package:flutter_app/features/authentication/data/models/token_response_model.dart';
import 'package:flutter_app/features/authentication/domain/entities/token_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTokenResponseModel = TokenResponseModel(
    sessionId: "5PxhZ2O8",
    accessToken: "token_string",
    refreshToken: "04043c74-d079-4110-9db6-7284fbcda6fd",
  );
  test('should be a sub class of TokenResponse', () async {
    expect(tTokenResponseModel, isA<TokenResponse>());
  });

  group('fromJson', () {
    test('Should return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('authentication/login_response.json'));
      //act
      final result = TokenResponseModel.fromJson(jsonMap);
      //assert
      expect(result, tTokenResponseModel);
    });
  });

  group('toJson', () {
    test('Should return a valid Json Map', () async {
      final result = tTokenResponseModel.toJson();
      final expected = {
        "sessionId": "5PxhZ2O8",
        "accessToken": "token_string",
        "refreshToken": "04043c74-d079-4110-9db6-7284fbcda6fd"
      };
      expect(result, expected);
    });
  });
}

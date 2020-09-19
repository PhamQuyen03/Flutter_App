import 'dart:convert';
import 'package:flutter_app/features/authentication/data/models/user_session_model.dart';
import 'package:flutter_app/features/authentication/domain/entities/user_session.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserSessionModel = UserSessionModel(
      id: 1, phoneNumber: "0338004227", fullName: "Quản trị viên");
  test('Should be a subclass of UserSession entity', () async {
    //assert
    expect(tUserSessionModel, isA<UserSession>());
  });
  group('fromJson', () {
    test('should return a valid model', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('authentication/user_session.json'));
      //act
      final result = UserSessionModel.fromJson(jsonMap);
      //assert
      expect(result, tUserSessionModel);
    });
  });

  group('toJson', () {
    test('should return a valid json map', () async {
      //act
      final result = tUserSessionModel.toJson();
      final expectResult = {
        "id": 1,
        "fullName": "Quản trị viên",
        "phoneNumber": "0338004227"
      };
      //assert
      expect(result, expectResult);
    });
  });
}

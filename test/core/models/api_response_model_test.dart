import 'dart:convert';
import 'package:flutter_app/core/models/api_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final tApiResponseModelSuccess = ApiResponseModel<dynamic>(
      data: {}, totalCount: 0, dataCount: 0, status: 1, message: "");
  final tApiResponseModelFail = ApiResponseModel<dynamic>(
      data: null, totalCount: 0, dataCount: 0, status: 0, message: "error");
  group('fromJson', () {
    test('should return a valid model when success', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('api_response_success.json'));
      //act
      final result = ApiResponseModel<dynamic>.fromJson(jsonMap, {});
      //assert
      expect(result, tApiResponseModelSuccess);
    });
    test('should return a valid model when fail', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('api_response_fail.json'));
      //act
      final result = ApiResponseModel<dynamic>.fromJson(jsonMap, null);
      //assert
      expect(result, tApiResponseModelFail);
    });
  });

  group('toJson', () {
    test('should return a valid json map', () async {
      //act
      final result = tApiResponseModelSuccess.toJson();
      final expectResult = {
        "data": {},
        "totalCount": 0,
        "dataCount": 0,
        "status": 1,
        "message": ""
      };
      //assert
      expect(result, expectResult);
    });
  });
}

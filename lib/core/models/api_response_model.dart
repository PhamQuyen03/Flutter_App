import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiResponseModel<T> extends Equatable {
  final int status;
  final String message;
  final int dataCount;
  final int totalCount;
  final T data;
  ApiResponseModel(
      {this.status, this.message, this.data, this.dataCount, this.totalCount});
  factory ApiResponseModel.fromJson(Map<String, dynamic> json, T data) {
    return ApiResponseModel(
        status: json['status'],
        message: json['message'],
        dataCount: json['dataCount'],
        totalCount: json['totalCount'],
        data: data);
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
      'dataCount': dataCount,
      'totalCount': totalCount
    };
  }

  @override
  // TODO: implement props
  List<Object> get props => [status, message, dataCount, totalCount, data];
}

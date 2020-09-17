import 'dart:convert';

class ApiResponseModel<T> {
  final int status;
  final String messsage;
  final int dataCount;
  final int totalCount;
  final T data;
  ApiResponseModel(
      {this.status, this.messsage, this.data, this.dataCount, this.totalCount});
  factory ApiResponseModel.fromJson(Map<String, dynamic> json, T data) {
    return ApiResponseModel(
        status: json['status'],
        messsage: json['message'],
        dataCount: json['dataCount'],
        totalCount: json['totalCount'],
        data: data);
  }
}

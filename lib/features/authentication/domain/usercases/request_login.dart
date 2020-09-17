import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/models/api_response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_response.dart';
import '../repositories/authentication_repository.dart';

class RequestLogin implements UseCase<ApiResponseModel<LoginResponse>, Params> {
  final AuthenticationRepository repository;
  RequestLogin(this.repository);

  @override
  Future<Either<Failure, ApiResponseModel<LoginResponse>>> call(
      Params params) async {
    return await repository.requestLogin(params.phoneNumber, params.password);
  }
}

class Params extends Equatable {
  final String phoneNumber;
  final String password;
  Params(this.phoneNumber, this.password);
  @override
  List<Object> get props => [phoneNumber, password];
}

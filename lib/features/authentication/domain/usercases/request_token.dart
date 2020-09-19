import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/api_response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/token_response.dart';
import '../repositories/authentication_repository.dart';

class RequestToken implements UseCase<ApiResponseModel<TokenResponse>, Params> {
  final AuthenticationRepository repository;
  RequestToken(this.repository);

  @override
  Future<Either<Failure, ApiResponseModel<TokenResponse>>> call(
      Params params) async {
    return await repository.requestNewToken(
        params.token, params.refreshToken, params.codeChallenge);
  }
}

class Params extends Equatable {
  final String token;
  final String refreshToken;
  final String codeChallenge;
  Params(this.token, this.refreshToken, this.codeChallenge);
  @override
  List<Object> get props => [token, refreshToken, codeChallenge];
}

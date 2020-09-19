import 'package:dartz/dartz.dart';
import 'package:flutter_app/features/authentication/domain/entities/token_response.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/api_response_model.dart';
import '../entities/login_response.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, ApiResponseModel<LoginResponse>>> requestLogin(
      String phoneNumber, String password);

  Future<Either<Failure, ApiResponseModel<TokenResponse>>> requestNewToken(
      String token, String refreshToken, String codeChallenge);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_app/features/authentication/domain/entities/token_response.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/api_response_model.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, ApiResponseModel<LoginResponse>>> requestLogin(
      String phoneNumber, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final loginResponse =
            await remoteDataSource.sendLoginRequest(phoneNumber, password);

        //localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(loginResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel<TokenResponse>>> requestNewToken(
    String token,
    String refreshToken,
    String codeChallenge,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final tokenResponse = await remoteDataSource.sendRefreshTokenRequest(
            token, refreshToken, codeChallenge);

        //localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(tokenResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel<int>>> requestRegister({
    String phoneNumber,
    String password,
    String fullName,
    String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final responseUserId = await remoteDataSource.sendRegisterRequest(
            phoneNumber: phoneNumber,
            password: password,
            fullName: fullName,
            email: email);

        //localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(responseUserId);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

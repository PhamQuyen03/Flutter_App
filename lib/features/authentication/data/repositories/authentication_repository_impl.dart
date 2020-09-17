import 'package:dartz/dartz.dart';

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
        final remoteTrivia =
            await remoteDataSource.sendLoginRequest(phoneNumber, password);

        //localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/api_response_model.dart';
import '../entities/login_response.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, ApiResponseModel<LoginResponse>>> requestLogin(
      String phoneNumber, String password);
}

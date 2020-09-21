import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';

class RequestRegister implements UseCase<int, Params> {
  final AuthenticationRepository repository;
  RequestRegister(this.repository);

  @override
  Future<Either<Failure, int>> call(Params params) async {
    return await repository.requestRegister(
      phoneNumber: params.phoneNumber,
      password: params.password,
      fullName: params.fullName,
      email: params.email,
    );
  }
}

class Params extends Equatable {
  final String phoneNumber;
  final String password;
  final String fullName;
  final String email;
  Params({this.phoneNumber, this.password, this.email, this.fullName});
  @override
  List<Object> get props => [phoneNumber, password, fullName, email];
}

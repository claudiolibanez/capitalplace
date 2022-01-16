import 'package:dartz/dartz.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/features/auth/domain/entities/user.dart';

abstract class DoLoginRepository {
  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  });
}

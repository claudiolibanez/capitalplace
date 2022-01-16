import 'package:dartz/dartz.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source.dart';
import 'package:capitalplace/src/features/auth/domain/entities/user.dart';
import 'package:capitalplace/src/features/auth/domain/repositories/do_login_repository.dart';

class DoLoginRepositoryImpl implements DoLoginRepository {
  final DoLoginDataSource _dataSource;

  DoLoginRepositoryImpl(
    this._dataSource,
  );

  @override
  Future<Either<Failure, User>> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      var result = await _dataSource.doLogin(
        email: email,
        password: password,
      );

      return Right(result);
    } on Failure catch (err) {
      return Left(err);
    }
  }
}

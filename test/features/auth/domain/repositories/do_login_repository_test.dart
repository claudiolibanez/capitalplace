import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/features/auth/data/models/user_model.dart';
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source.dart';
import 'package:capitalplace/src/features/auth/data/repositories/do_login_repository_imp.dart';
import 'package:capitalplace/src/features/auth/domain/repositories/do_login_repository.dart';

class DoLoginDataSourceMock extends Mock implements DoLoginDataSource {}

void main() {
  DoLoginDataSource _dataSource = DoLoginDataSourceMock();
  DoLoginRepository _repository = DoLoginRepositoryImpl(_dataSource);

  test('should do login', () async {
    when(
      () => _dataSource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"),
      ),
    ).thenAnswer((invocation) async => tUser);

    var result = await _repository.doLogin(
      email: "email@email.com",
      password: "password123456",
    );

    expect(result, isA<Right>());

    expect(result, Right(tUser));

    verify(
      () => _dataSource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"),
      ),
    ).called(1);

    verifyNoMoreInteractions(_dataSource);
  });

  test('should get error when logging in', () async {
    when(
      () => _dataSource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"),
      ),
    ).thenThrow(PasswordWrongFailure());

    var result = await _repository.doLogin(
      email: "email@email.com",
      password: "password123456",
    );

    expect(result, isA<Left>());

    expect(result, Left(PasswordWrongFailure()));

    verify(
      () => _dataSource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"),
      ),
    ).called(1);

    verifyNoMoreInteractions(_dataSource);
  });
}

var tUser = const UserModel(
  name: 'User name',
  email: 'email@email.com',
);

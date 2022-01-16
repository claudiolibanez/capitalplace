import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/features/auth/domain/entities/user.dart';
import 'package:capitalplace/src/features/auth/domain/repositories/do_login_repository.dart';
import 'package:capitalplace/src/features/auth/domain/usecases/do_login.dart';

class DoLoginRepositoryMock extends Mock implements DoLoginRepository {}

void main() {
  DoLoginRepository _doLoginRepository = DoLoginRepositoryMock();

  DoLogin _doLogin = DoLogin(_doLoginRepository);

  test('should do login', () async {
    when(
      () => _doLoginRepository.doLogin(
        email: 'email@email.com',
        password: '123456',
      ),
    ).thenAnswer(
      (_) async => Right(tUser),
    );

    var result = await _doLogin(
      DoLoginParams(
        email: 'email@email.com',
        password: '123456',
      ),
    );

    expect(result, isA<Right>());

    expect(result, Right(tUser));

    verify(
      () => _doLoginRepository.doLogin(
        email: 'email@email.com',
        password: '123456',
      ),
    ).called(1);

    verifyNoMoreInteractions(_doLoginRepository);
  });

  test('should get a wrong password error when logging in', () async {
    when(
      () => _doLoginRepository.doLogin(
        email: 'email@email.com',
        password: '123456',
      ),
    ).thenAnswer((_) async => Left(PasswordWrongFailure()));

    var result = await _doLogin(
      DoLoginParams(
        email: 'email@email.com',
        password: '123456',
      ),
    );

    expect(result, isA<Left>());

    expect(result, Left(PasswordWrongFailure()));

    verify(
      () => _doLoginRepository.doLogin(
        email: 'email@email.com',
        password: '123456',
      ),
    ).called(1);

    verifyNoMoreInteractions(_doLoginRepository);
  });
}

var tUser = const User(
  name: 'User name',
  email: 'email@email.com',
);

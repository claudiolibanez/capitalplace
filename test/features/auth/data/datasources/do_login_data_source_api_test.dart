import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/shared/client/client_http_dio.dart';
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:capitalplace/src/features/auth/data/models/user_model.dart';

class DioMock extends Mock implements ClientHttpDio {}

void main() {
  var dio = DioMock();
  var dataSource = DoLoginDataSourceApi(dio);

  test('should do login on API', () async {
    when(
      () => dio.post(
        any(),
        data: {"email": "email@email.com", "password": "123456"},
      ),
    ).thenAnswer(
      (invocation) => Future.value(
        Response(requestOptions: RequestOptions(path: ''), data: tUserApi),
      ),
    );

    UserModel user =
        await dataSource.doLogin(email: 'email@email.com', password: '123456');

    expect(user.toMap(), tUserApi);

    verify(
      () => dio.post(
        any(),
        data: {"email": "email@email.com", "password": "123456"},
      ),
    ).called(1);

    verifyNoMoreInteractions(dio);
  });

  test('should get error when try do login with API', () async {
    when(
      () => dio.post(
        any(),
        data: {"email": "email@email.com", "password": "123456"},
      ),
    ).thenThrow(
      ServerFailure(),
    );

    expect(
      () async => await dataSource.doLogin(
          email: 'email@email.com', password: '123456'),
      throwsA(
        isA<ServerFailure>(),
      ),
    );

    verify(
      () => dio.post(
        any(),
        data: {"email": "email@email.com", "password": "123456"},
      ),
    ).called(1);

    verifyNoMoreInteractions(dio);
  });
}

var tUserApi = {
  "name": "Nome",
  "email": "email@email.com",
};

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source_firebase.dart';

class DioMock extends Mock implements Dio {}

void main() {
  var dataSource = DoLoginDataSourceFirebase();

  test('should get error when try do login with Firebase', () async {
    expect(
      () async => await dataSource.doLogin(
          email: 'email@email.com', password: '123456'),
      throwsA(
        isA<UnimplementedError>(),
      ),
    );
  });
}

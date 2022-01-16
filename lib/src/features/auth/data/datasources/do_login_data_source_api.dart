import 'package:capitalplace/src/shared/client/client_http_dio.dart';

import 'package:capitalplace/src/core/error/failure.dart';
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source.dart';
import 'package:capitalplace/src/features/auth/data/models/user_model.dart';

class DoLoginDataSourceApi implements DoLoginDataSource {
  final ClientHttpDio _client;

  DoLoginDataSourceApi(
    this._client,
  );

  // final HttpClient _httpClient;

  // DoLoginDataSourceApi({
  //   required this._httpClient,
  // });

  @override
  Future<UserModel> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      // var response = await _dio.post(
      //   'http://www.api.com/user',
      //   data: {
      //     "email": email,
      //     "password": password,
      //   },
      // );

      // return UserModel.fromMap(response.data);

      return Future.value(UserModel.fromMap(tUserApi));
    } catch (err) {
      throw ServerFailure();
    }
  }
}

var tUserApi = {
  "name": "Nome",
  "email": "email@email.com",
};

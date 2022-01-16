import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source.dart';
import 'package:capitalplace/src/features/auth/data/models/user_model.dart';

class DoLoginDataSourceFirebase implements DoLoginDataSource {
  @override
  Future<UserModel> doLogin({
    required String email,
    required String password,
  }) {
    // TODO: implement doLogin
    throw UnimplementedError();
  }
}

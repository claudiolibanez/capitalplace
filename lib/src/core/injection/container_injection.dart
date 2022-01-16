import 'package:get_it/get_it.dart';

// data source
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source.dart';
import 'package:capitalplace/src/features/auth/data/datasources/do_login_data_source_api.dart';

// repository
import 'package:capitalplace/src/features/auth/domain/repositories/do_login_repository.dart';
import 'package:capitalplace/src/features/auth/data/repositories/do_login_repository_imp.dart';

// use case
import 'package:capitalplace/src/features/auth/domain/usecases/do_login.dart';

// controller
import 'package:capitalplace/src/features/auth/presenter/controllers/login_controller.dart';
import 'package:capitalplace/src/features/auth/presenter/controllers/login_code_controller.dart';

// shared
import 'package:capitalplace/src/shared/client/client_http_dio.dart';

final i = GetIt.instance;

class ContainerInjection {
  static void setup() {
    i.registerLazySingleton<ClientHttpDio>(() => ClientHttpDio());
    i.registerLazySingleton<DoLoginDataSource>(
        () => DoLoginDataSourceApi(i.get()));
    i.registerLazySingleton<DoLoginRepository>(
        () => DoLoginRepositoryImpl(i.get()));
    i.registerLazySingleton<DoLogin>(() => DoLogin(i.get()));
    i.registerFactory<LoginController>(() => LoginController(i.get()));
    i.registerFactory<LoginCodeController>(() => LoginCodeController());
  }
}

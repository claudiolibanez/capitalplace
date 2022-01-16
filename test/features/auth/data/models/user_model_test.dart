import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:capitalplace/src/features/auth/data/models/user_model.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('should convert model to map', () {
    var model = const UserModel(
      name: 'Nome',
      email: 'email@email.com',
    );

    var map = model.toMap();

    expect(map, tkUserApi);
  });

  test('should convert model to json', () async {
    var model = const UserModel(
      name: 'Nome',
      email: 'email@email.com',
    );

    var data = await rootBundle.loadString('assets/mock/user.json');

    var userJson = model.toJson();

    var user = UserModel.fromJson(data);

    expect(user.toJson(), userJson);
  });

  test('should get user from json', () async {
    var model = const UserModel(
      name: 'Nome',
      email: 'email@email.com',
    );

    var data = await rootBundle.loadString('assets/mock/user.json');

    var userJson = UserModel.fromJson(data);

    expect(userJson, model);
  });

  test('should get user from map', () async {
    var model = const UserModel(
      name: 'Nome',
      email: 'email@email.com',
    );

    var userMap = UserModel.fromMap(tkUserApi);

    expect(userMap, model);
  });
}

var tkUserApi = {
  "name": "Nome",
  "email": "email@email.com",
};

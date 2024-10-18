import 'dart:convert';

import 'package:mobx/mobx.dart';

import '../../core/global/verzel_constants.dart';
import '../../core/storage/storage.dart';
import '../../models/user_model.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  User? user;

  @action
  void setAuth(User? value) => user = value;

  @action
  Future<void> getCurrentUser() async {
    setAuth(null);
    final jsonText =
        await Storage().getData(SessionStorageKeys.accessToken.key);
    if (jsonText != null) {
      user = User.fromMap(json.decode(jsonText));
    }
  }

  @action
  Future<void> logout() async {
    setAuth(null);
    Storage().clean();
  }

  bool get isLoggedIn => user != null;
}

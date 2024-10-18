import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../../core/data_base/db_user.dart';
import '../../core/global/verzel_constants.dart';
import '../../core/storage/storage.dart';
import '../../models/user_model.dart';
import './user_service.dart';

class UserServiceImpl implements UserService {
  final _authController = GetIt.I<Storage>();
  @override
  Future<User> save(User user) async {
    return DbUser.create(user);
  }

  @override
  Future<User?> login(({String? email, String? password}) userData) async {
    final User? user = await DbUser.readByEmail(userData);
    if (user != null) {
      await _authController.setData(
        SessionStorageKeys.accessToken.key,
        json.encode(user.toMap()),
      );
    }
    return user != null && user.password == userData.password ? user : null;
  }
}

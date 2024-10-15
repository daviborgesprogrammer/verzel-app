import '../../core/data_base/db_provider.dart';
import '../../models/user_model.dart';
import './user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<int> save(User user) async {
    return DBProvider.i.insert(user);
  }

  @override
  Future<User?> login(({String? email, String? password}) userData) async {
    final User? user = await DBProvider.i.getByEmail(userData);
    return user != null && user.password == userData.password ? user : null;
  }
}

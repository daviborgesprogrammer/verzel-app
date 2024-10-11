import '../../core/data_base/db_provider.dart';
import '../../models/user_model.dart';
import './user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<int> insert(User user) async {
    return DBProvider.i.insert(user);
  }

  @override
  Future<User?> get(int id) async => DBProvider.i.get(id);
}

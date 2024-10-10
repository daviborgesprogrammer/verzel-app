import '../../core/data_base/db_provider.dart';
import '../../models/user_model.dart';
import './user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<void> insert(User user) async {
    await DBProvider.i.insert(user);
  }
}

import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract interface class UserService {
  Future<int> insert(User user);
  Future<User?> get(int id);

  factory UserService() => UserServiceImpl();
}

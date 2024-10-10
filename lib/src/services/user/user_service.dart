import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract interface class UserService {
  Future<void> insert(User user);

  factory UserService() => UserServiceImpl();
}

import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract interface class UserService {
  Future<User> save(User user);
  Future<User?> login(({String? email, String? password}) userData);

  factory UserService() => UserServiceImpl();
}

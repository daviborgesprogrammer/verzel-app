import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/auth_controller.dart';
part 'task_list_controller.g.dart';

enum TaskListStatus {
  initial,
  loading,
  loaded,
  logout,
  error,
}

class TaskListController = TaskListControllerBase with _$TaskListController;

abstract class TaskListControllerBase with Store {
  final authController = GetIt.I<AuthController>();

  @readonly
  var _status = TaskListStatus.initial;

  @readonly
  String? _errorMessage;

  @action
  Future<void> logout() async {
    try {
      _status = TaskListStatus.loading;
      await authController.logout();
      _status = TaskListStatus.logout;
    } catch (e) {
      _errorMessage = 'Erro ao deslogar usuário';
      _status = TaskListStatus.error;
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../models/task_model.dart';
import '../../services/task/task_service.dart';
import '../auth/auth_controller.dart';

part 'task_list_controller.g.dart';

enum TaskListStatus {
  initial,
  loading,
  loaded,
  success,
  logout,
  error,
}

class TaskListController = TaskListControllerBase with _$TaskListController;

abstract class TaskListControllerBase with Store {
  final _taskService = GetIt.I<TaskService>();

  final authController = GetIt.I<AuthController>();

  @readonly
  var _status = TaskListStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int? userId;

  @readonly
  List<Task> _tasks = <Task>[];

  @action
  void setUserId(int? value) => userId = value;

  int get taskCount => _tasks.length;

  @action
  Future<void> fetchTasks() async {
    try {
      _status = TaskListStatus.loading;
      _tasks = await _taskService.readTaskByUser(userId ?? 0);
      _status = TaskListStatus.loaded;
    } catch (e) {
      _errorMessage = 'Erro ao deslogar usuário';
      _status = TaskListStatus.error;
    }
  }

  @action
  Future<void> delete(int id) async {
    try {
      _status = TaskListStatus.loading;
      final int result = await _taskService.delete(id);
      if (result == 1) {
        _tasks.removeWhere((t) => t.id == id);
        _tasks = [..._tasks];
        _status = TaskListStatus.success;
      } else {
        _errorMessage = 'Erro ao excluir tarefa';
        _status = TaskListStatus.error;
      }
    } catch (e) {
      _errorMessage = 'Erro ao excluir tarefa';

      _status = TaskListStatus.error;
    }
  }

  @action
  Future<void> conclude(Task task) async {
    try {
      _status = TaskListStatus.loading;
      task.conclusionDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
      task = task.copyWith(
        conclusionDate: () => DateFormat('dd/MM/yyyy').format(DateTime.now()),
        status: () => TaskStatus.concluded,
      );
      final int result = await _taskService.conclude(task);
      if (result == 1) {
        final int index = _tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          _tasks[index] = task;
        }
        _tasks = [..._tasks];
        _status = TaskListStatus.success;
      } else {
        _errorMessage = 'Erro ao concluir a tarefa';
        _status = TaskListStatus.error;
      }
      _status = TaskListStatus.success;
    } catch (e) {
      _errorMessage = 'Erro ao concluir tarefa';
      _status = TaskListStatus.error;
    }
  }

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

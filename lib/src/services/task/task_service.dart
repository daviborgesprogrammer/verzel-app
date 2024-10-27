import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract interface class TaskService {
  Future<Task> save(Task task);

  Future<int> update(Task task);

  Future<List<Task>> readTaskByUser(int id);

  Future<int> delete(int id);

  Future<int> conclude(Task task);

  factory TaskService() => TaskServiceImpl();
}

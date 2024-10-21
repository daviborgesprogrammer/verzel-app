import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract interface class TaskService {
  Future<Task> save(Task task);

  Future<List<Task>> readTaskByUser(int id);

  factory TaskService() => TaskServiceImpl();
}
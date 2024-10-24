import '../../core/data_base/db_task.dart';
import '../../models/task_model.dart';
import './task_service.dart';

class TaskServiceImpl implements TaskService {
  @override
  Future<Task> save(Task task) {
    return DbTask.create(task);
  }

  @override
  Future<List<Task>> readTaskByUser(int id) async {
    final tasks = await DbTask.readByUser(id);
    return tasks.where((t) => t.status != TaskStatus.deleted).toList();
  }

  @override
  Future<int> delete(int id) async {
    return DbTask.delete(id);
  }
}

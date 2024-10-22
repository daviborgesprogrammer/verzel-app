import '../../core/data_base/db_task.dart';
import '../../models/task_model.dart';
import './task_service.dart';

class TaskServiceImpl implements TaskService {
  @override
  Future<Task> save(Task task) {
    return DbTask.create(task);
  }

  @override
  Future<List<Task>> readTaskByUser(int id) {
    return DbTask.readByUser(id);
  }

  @override
  Future<int> delete(int id) async {
    return DbTask.delete(id);
  }
}

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/task_model.dart';
import '../../services/task/task_service.dart';
part 'task_manager_controller.g.dart';

enum TaskManagerStatus {
  initial,
  loading,
  save,
  update,
  error,
}

enum TaskManagerState {
  creation,
  editing,
  preview,
}

class TaskManagerController = TaskManagerControllerBase
    with _$TaskManagerController;

abstract class TaskManagerControllerBase with Store {
  final _taskService = GetIt.I<TaskService>();

  @readonly
  var _status = TaskManagerStatus.initial;

  @observable
  TaskManagerState screenStates = TaskManagerState.creation;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  Task? task;

  @observable
  Task? taskEdit;

  @action
  void setUserId(int value) => taskEdit!.id = value;

  @action
  void setTask(Task value) => task = value;

  @action
  void setTaskEdit(Task value) => taskEdit = value;

  @action
  void setTitle(String value) =>
      taskEdit = taskEdit?.copyWith(title: () => value);

  @action
  void setDeliveryDate(String value) =>
      taskEdit = taskEdit?.copyWith(deliveryDate: () => value);

  @action
  void setConclusionDate(String value) =>
      taskEdit = taskEdit?.copyWith(conclusionDate: () => value);

  @action
  void setScreenStates(TaskManagerState value) {
    if (value == TaskManagerState.editing) {
      taskEdit = task?.copyWith();
    }
    screenStates = value;
  }

  @computed
  bool get titleValid => taskEdit?.title != null && taskEdit!.title!.isNotEmpty;
  String? get titleError {
    if (!_showErrors || titleValid) {
      return null;
    } else {
      return 'Titulo obrigatório';
    }
  }

  @computed
  bool get deliveryDateValid => taskEdit!.deliveryDate != null;
  String? get deliveryDateError {
    if (!_showErrors || deliveryDateValid) {
      return null;
    } else {
      return 'Data de entrega é obrigatória';
    }
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid => titleValid && deliveryDateValid;

  @computed
  dynamic get sendPressed => isFormValid ? registerTask : null;

  @action
  Future<void> registerTask() async {
    try {
      _status = TaskManagerStatus.loading;

      final taskItem = Task(
        id: taskEdit!.id,
        idUser: taskEdit!.idUser,
        title: taskEdit!.title,
        deliveryDate: taskEdit!.deliveryDate,
        conclusionDate: taskEdit!.conclusionDate,
        status: taskEdit!.conclusionDate != null
            ? TaskStatus.concluded
            : TaskStatus.active,
      );
      if (screenStates == TaskManagerState.creation) {
        await _taskService.save(taskItem);
        _status = TaskManagerStatus.save;
      } else {
        await _taskService.update(taskItem);
        _status = TaskManagerStatus.update;
      }
    } catch (e, s) {
      log('Erro ao salvar tarefa', error: e, stackTrace: s);
      _status = TaskManagerStatus.error;
    }
  }
}

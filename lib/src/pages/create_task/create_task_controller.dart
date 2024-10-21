// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/task_model.dart';
import '../../services/task/task_service.dart';

part 'create_task_controller.g.dart';

enum CreateTaskStatus {
  initial,
  loading,
  success,
  error,
}

class CreateTaskController = CreateTaskControllerBase
    with _$CreateTaskController;

abstract class CreateTaskControllerBase with Store {
  final _taskService = GetIt.I<TaskService>();
  @readonly
  var _status = CreateTaskStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? title;

  @observable
  String? deliveryDate;

  @observable
  String? conclusionDate;

  @observable
  String? userId;

  @action
  void setUserId(String value) => userId = value;

  @action
  void setTitle(String value) => title = value;

  @action
  void setDeliveryDate(String value) => deliveryDate = value;

  @action
  void setConclusionDate(String value) => conclusionDate = value;

  @computed
  bool get titleValid => title != null && title!.isNotEmpty;
  String? get titleError {
    if (!_showErrors || titleValid) {
      return null;
    } else {
      return 'Title required';
    }
  }

  @computed
  bool get deliveryDateValid => deliveryDate != null;
  String? get deliveryDateError {
    if (!_showErrors || deliveryDateValid) {
      return null;
    } else {
      return 'Delivery Date is required';
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
      _status = CreateTaskStatus.loading;
      final task = Task(
        idUser: int.parse(userId ?? '0'),
        title: title,
        deliveryDate: deliveryDate,
        conclusionDate: conclusionDate,
        status: TaskStatus.active,
      );
      await _taskService.save(task);
      _status = CreateTaskStatus.success;
    } catch (e, s) {
      log('Erro ao salvar tarefa', error: e, stackTrace: s);
      _status = CreateTaskStatus.error;
    }
  }
}

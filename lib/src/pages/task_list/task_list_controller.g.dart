// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListController on TaskListControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'TaskListControllerBase._status', context: context);

  TaskListStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskListStatus get _status => status;

  @override
  set _status(TaskListStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'TaskListControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'TaskListControllerBase.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$_tasksAtom =
      Atom(name: 'TaskListControllerBase._tasks', context: context);

  List<Task> get tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  List<Task> get _tasks => tasks;

  @override
  set _tasks(List<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$fetchTasksAsyncAction =
      AsyncAction('TaskListControllerBase.fetchTasks', context: context);

  @override
  Future<void> fetchTasks() {
    return _$fetchTasksAsyncAction.run(() => super.fetchTasks());
  }

  late final _$deleteAsyncAction =
      AsyncAction('TaskListControllerBase.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$concludeAsyncAction =
      AsyncAction('TaskListControllerBase.conclude', context: context);

  @override
  Future<void> conclude(Task task) {
    return _$concludeAsyncAction.run(() => super.conclude(task));
  }

  late final _$logoutAsyncAction =
      AsyncAction('TaskListControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$TaskListControllerBaseActionController =
      ActionController(name: 'TaskListControllerBase', context: context);

  @override
  void setUserId(int? value) {
    final _$actionInfo = _$TaskListControllerBaseActionController.startAction(
        name: 'TaskListControllerBase.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$TaskListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId}
    ''';
  }
}

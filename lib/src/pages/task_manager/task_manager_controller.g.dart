// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_manager_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskManagerController on TaskManagerControllerBase, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: 'TaskManagerControllerBase.titleValid'))
          .value;
  Computed<bool>? _$deliveryDateValidComputed;

  @override
  bool get deliveryDateValid => (_$deliveryDateValidComputed ??= Computed<bool>(
          () => super.deliveryDateValid,
          name: 'TaskManagerControllerBase.deliveryDateValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TaskManagerControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'TaskManagerControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'TaskManagerControllerBase._status', context: context);

  TaskManagerStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskManagerStatus get _status => status;

  @override
  set _status(TaskManagerStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$screenStatesAtom =
      Atom(name: 'TaskManagerControllerBase.screenStates', context: context);

  @override
  TaskManagerState get screenStates {
    _$screenStatesAtom.reportRead();
    return super.screenStates;
  }

  @override
  set screenStates(TaskManagerState value) {
    _$screenStatesAtom.reportWrite(value, super.screenStates, () {
      super.screenStates = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'TaskManagerControllerBase._errorMessage', context: context);

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

  late final _$_showErrorsAtom =
      Atom(name: 'TaskManagerControllerBase._showErrors', context: context);

  bool get showErrors {
    _$_showErrorsAtom.reportRead();
    return super._showErrors;
  }

  @override
  bool get _showErrors => showErrors;

  @override
  set _showErrors(bool value) {
    _$_showErrorsAtom.reportWrite(value, super._showErrors, () {
      super._showErrors = value;
    });
  }

  late final _$taskAtom =
      Atom(name: 'TaskManagerControllerBase.task', context: context);

  @override
  Task? get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task? value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$taskEditAtom =
      Atom(name: 'TaskManagerControllerBase.taskEdit', context: context);

  @override
  Task? get taskEdit {
    _$taskEditAtom.reportRead();
    return super.taskEdit;
  }

  @override
  set taskEdit(Task? value) {
    _$taskEditAtom.reportWrite(value, super.taskEdit, () {
      super.taskEdit = value;
    });
  }

  late final _$registerTaskAsyncAction =
      AsyncAction('TaskManagerControllerBase.registerTask', context: context);

  @override
  Future<void> registerTask() {
    return _$registerTaskAsyncAction.run(() => super.registerTask());
  }

  late final _$TaskManagerControllerBaseActionController =
      ActionController(name: 'TaskManagerControllerBase', context: context);

  @override
  void setUserId(int value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTask(Task value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setTask');
    try {
      return super.setTask(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaskEdit(Task value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setTaskEdit');
    try {
      return super.setTaskEdit(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryDate(String value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setDeliveryDate');
    try {
      return super.setDeliveryDate(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConclusionDate(String value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setConclusionDate');
    try {
      return super.setConclusionDate(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreenStates(TaskManagerState value) {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.setScreenStates');
    try {
      return super.setScreenStates(value);
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$TaskManagerControllerBaseActionController
        .startAction(name: 'TaskManagerControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$TaskManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenStates: ${screenStates},
task: ${task},
taskEdit: ${taskEdit},
titleValid: ${titleValid},
deliveryDateValid: ${deliveryDateValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}

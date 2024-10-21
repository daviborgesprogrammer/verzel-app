// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTaskController on CreateTaskControllerBase, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: 'CreateTaskControllerBase.titleValid'))
          .value;
  Computed<bool>? _$deliveryDateValidComputed;

  @override
  bool get deliveryDateValid => (_$deliveryDateValidComputed ??= Computed<bool>(
          () => super.deliveryDateValid,
          name: 'CreateTaskControllerBase.deliveryDateValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'CreateTaskControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'CreateTaskControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'CreateTaskControllerBase._status', context: context);

  CreateTaskStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  CreateTaskStatus get _status => status;

  @override
  set _status(CreateTaskStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'CreateTaskControllerBase._errorMessage', context: context);

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
      Atom(name: 'CreateTaskControllerBase._showErrors', context: context);

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

  late final _$titleAtom =
      Atom(name: 'CreateTaskControllerBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$deliveryDateAtom =
      Atom(name: 'CreateTaskControllerBase.deliveryDate', context: context);

  @override
  String? get deliveryDate {
    _$deliveryDateAtom.reportRead();
    return super.deliveryDate;
  }

  @override
  set deliveryDate(String? value) {
    _$deliveryDateAtom.reportWrite(value, super.deliveryDate, () {
      super.deliveryDate = value;
    });
  }

  late final _$conclusionDateAtom =
      Atom(name: 'CreateTaskControllerBase.conclusionDate', context: context);

  @override
  String? get conclusionDate {
    _$conclusionDateAtom.reportRead();
    return super.conclusionDate;
  }

  @override
  set conclusionDate(String? value) {
    _$conclusionDateAtom.reportWrite(value, super.conclusionDate, () {
      super.conclusionDate = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'CreateTaskControllerBase.userId', context: context);

  @override
  String? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$registerTaskAsyncAction =
      AsyncAction('CreateTaskControllerBase.registerTask', context: context);

  @override
  Future<void> registerTask() {
    return _$registerTaskAsyncAction.run(() => super.registerTask());
  }

  late final _$CreateTaskControllerBaseActionController =
      ActionController(name: 'CreateTaskControllerBase', context: context);

  @override
  void setUserId(String value) {
    final _$actionInfo = _$CreateTaskControllerBaseActionController.startAction(
        name: 'CreateTaskControllerBase.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$CreateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$CreateTaskControllerBaseActionController.startAction(
        name: 'CreateTaskControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$CreateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeliveryDate(String value) {
    final _$actionInfo = _$CreateTaskControllerBaseActionController.startAction(
        name: 'CreateTaskControllerBase.setDeliveryDate');
    try {
      return super.setDeliveryDate(value);
    } finally {
      _$CreateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConclusionDate(String value) {
    final _$actionInfo = _$CreateTaskControllerBaseActionController.startAction(
        name: 'CreateTaskControllerBase.setConclusionDate');
    try {
      return super.setConclusionDate(value);
    } finally {
      _$CreateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$CreateTaskControllerBaseActionController.startAction(
        name: 'CreateTaskControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$CreateTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
deliveryDate: ${deliveryDate},
conclusionDate: ${conclusionDate},
userId: ${userId},
titleValid: ${titleValid},
deliveryDateValid: ${deliveryDateValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}

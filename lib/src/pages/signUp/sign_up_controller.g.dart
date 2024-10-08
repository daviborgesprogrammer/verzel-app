// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on SignUpControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'SignUpControllerBase.nameValid'))
          .value;
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid =>
      (_$cpfValidComputed ??= Computed<bool>(() => super.cpfValid,
              name: 'SignUpControllerBase.cpfValid'))
          .value;
  Computed<bool>? _$birthdateValidComputed;

  @override
  bool get birthdateValid =>
      (_$birthdateValidComputed ??= Computed<bool>(() => super.birthdateValid,
              name: 'SignUpControllerBase.birthdateValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'SignUpControllerBase.emailValid'))
          .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'SignUpControllerBase.zipValid'))
          .value;
  Computed<bool>? _$numberValidComputed;

  @override
  bool get numberValid =>
      (_$numberValidComputed ??= Computed<bool>(() => super.numberValid,
              name: 'SignUpControllerBase.numberValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'SignUpControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePasswordValidComputed;

  @override
  bool get retypePasswordValid => (_$retypePasswordValidComputed ??=
          Computed<bool>(() => super.retypePasswordValid,
              name: 'SignUpControllerBase.retypePasswordValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SignUpControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'SignUpControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'SignUpControllerBase._status', context: context);

  SignUpStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SignUpStatus get _status => status;

  @override
  set _status(SignUpStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'SignUpControllerBase._errorMessage', context: context);

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
      Atom(name: 'SignUpControllerBase._showErrors', context: context);

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

  late final _$nameAtom =
      Atom(name: 'SignUpControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'SignUpControllerBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$birthdateAtom =
      Atom(name: 'SignUpControllerBase.birthdate', context: context);

  @override
  String? get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String? value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignUpControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$zipAtom =
      Atom(name: 'SignUpControllerBase.zip', context: context);

  @override
  String? get zip {
    _$zipAtom.reportRead();
    return super.zip;
  }

  @override
  set zip(String? value) {
    _$zipAtom.reportWrite(value, super.zip, () {
      super.zip = value;
    });
  }

  late final _$_addressAtom =
      Atom(name: 'SignUpControllerBase._address', context: context);

  Address? get address {
    _$_addressAtom.reportRead();
    return super._address;
  }

  @override
  Address? get _address => address;

  @override
  set _address(Address? value) {
    _$_addressAtom.reportWrite(value, super._address, () {
      super._address = value;
    });
  }

  late final _$numberAtom =
      Atom(name: 'SignUpControllerBase.number', context: context);

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignUpControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$retypePasswordAtom =
      Atom(name: 'SignUpControllerBase.retypePassword', context: context);

  @override
  String? get retypePassword {
    _$retypePasswordAtom.reportRead();
    return super.retypePassword;
  }

  @override
  set retypePassword(String? value) {
    _$retypePasswordAtom.reportWrite(value, super.retypePassword, () {
      super.retypePassword = value;
    });
  }

  late final _$showDatePickerAtom =
      Atom(name: 'SignUpControllerBase.showDatePicker', context: context);

  @override
  bool get showDatePicker {
    _$showDatePickerAtom.reportRead();
    return super.showDatePicker;
  }

  @override
  set showDatePicker(bool value) {
    _$showDatePickerAtom.reportWrite(value, super.showDatePicker, () {
      super.showDatePicker = value;
    });
  }

  late final _$setZipAsyncAction =
      AsyncAction('SignUpControllerBase.setZip', context: context);

  @override
  Future<void> setZip(String value) {
    return _$setZipAsyncAction.run(() => super.setZip(value));
  }

  late final _$fetchZipAsyncAction =
      AsyncAction('SignUpControllerBase.fetchZip', context: context);

  @override
  Future<void> fetchZip(String zipFilter) {
    return _$fetchZipAsyncAction.run(() => super.fetchZip(zipFilter));
  }

  late final _$registerAsyncAction =
      AsyncAction('SignUpControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$SignUpControllerBaseActionController =
      ActionController(name: 'SignUpControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthdate(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowDatePicker(bool value) {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.setShowDatePicker');
    try {
      return super.setShowDatePicker(value);
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$SignUpControllerBaseActionController.startAction(
        name: 'SignUpControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
cpf: ${cpf},
birthdate: ${birthdate},
email: ${email},
zip: ${zip},
number: ${number},
password: ${password},
retypePassword: ${retypePassword},
showDatePicker: ${showDatePicker},
nameValid: ${nameValid},
cpfValid: ${cpfValid},
birthdateValid: ${birthdateValid},
emailValid: ${emailValid},
zipValid: ${zipValid},
numberValid: ${numberValid},
passwordValid: ${passwordValid},
retypePasswordValid: ${retypePasswordValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}

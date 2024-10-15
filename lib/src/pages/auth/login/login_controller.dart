import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/extensions/validator_extensions.dart';
import '../../../services/user/user_service.dart';
part 'login_controller.g.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final _userService = GetIt.I<UserService>();

  @readonly
  var _status = LoginStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? email;

  @observable
  String? password;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get emailValid => email != null && email!.isEmailValid;
  String? get emailError {
    if (!_showErrors || emailValid) {
      return null;
    } else if (email == null || (email != null && email!.isEmpty)) {
      return 'Email required';
    } else {
      return 'Email invalid';
    }
  }

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (!_showErrors || passwordValid) {
      return null;
    } else if (password == null || password!.isNotEmpty) {
      return 'Password required';
    } else {
      return 'Very short password';
    }
  }

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  dynamic get sendPressed => isFormValid ? login : null;

  @action
  Future<void> login() async {
    try {
      _status = LoginStatus.loading;
      final userData = (email: email, password: password);
      final auth = await _userService.login(userData);
      if (auth != null) {
        _status = LoginStatus.success;
      } else {
        _errorMessage = 'Email e/ou senha inválido(s)';
        _status = LoginStatus.error;
      }
    } catch (e, s) {
      log('Erro ao logar', stackTrace: s, error: e);
      _errorMessage = 'Erro ao logar';
      _status = LoginStatus.error;
    }
  }
}

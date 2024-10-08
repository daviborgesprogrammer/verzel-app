import 'package:mobx/mobx.dart';

import '../../core/extensions/validator_extensions.dart';
import '../../models/address_model.dart';
import '../../services/zip_service/zip_service.dart';
part 'sign_up_controller.g.dart';

enum SignUpStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class SignUpController = SignUpControllerBase with _$SignUpController;

abstract class SignUpControllerBase with Store {
  @readonly
  var _status = SignUpStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? name;

  @observable
  String? cpf;

  @observable
  String? birthdate;

  @observable
  String? email;

  @observable
  String? zip;

  @readonly
  Address? _address;

  @observable
  String? number;

  @observable
  String? password;

  @observable
  String? retypePassword;

  @observable
  bool showDatePicker = false;

  @action
  void setName(String value) => name = value;

  @action
  void setCPF(String value) => cpf = value;

  @action
  void setBirthdate(String value) => birthdate = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRetypePass(String value) => retypePassword = value;

  @action
  void setShowDatePicker(bool value) => showDatePicker = value;

  @action
  Future<void> setZip(String value) async {
    zip = value;
    if (value.length >= 10) {
      await fetchZip(value);
    }
  }

  @computed
  bool get nameValid => name != null && name!.trim().length > 3;
  String? get nameError {
    if (!_showErrors || nameValid) {
      return null;
    } else if (name == null || name!.isEmpty) {
      return 'Name required';
    } else {
      return 'Very short name';
    }
  }

  @computed
  bool get cpfValid => cpf != null && cpf!.isCPFValid;
  String? get cpfError {
    if (!_showErrors || cpfValid) {
      return null;
    } else if (cpf == null || cpf!.isEmpty) {
      return 'CPF required';
    } else if (!cpf!.isCPFValid) {
      return 'CPF invalid';
    } else {
      return 'Very short CPF';
    }
  }

  @computed
  bool get birthdateValid => birthdate != null;
  String? get birthdateError {
    if (!_showErrors || birthdateValid) {
      return null;
    } else {
      return 'Select date of birth';
    }
  }

  @computed
  bool get emailValid => email != null && email!.isEmailValid;
  String? get emailError {
    if (!_showErrors || emailValid) {
      return null;
    } else if (email == null || email!.isEmpty) {
      return 'Email required';
    } else {
      return 'Email invalid';
    }
  }

  @computed
  bool get zipValid => zip != null && zip!.length >= 10;
  String? get zipError {
    if (!_showErrors || zipValid) {
      return null;
    } else if (zip == null || zip!.isEmpty) {
      return 'Zip required';
    } else {
      return 'Very short Zip';
    }
  }

  @computed
  bool get numberValid => number != null && number!.isNotEmpty;
  String? get numberError {
    if (!_showErrors || numberValid) {
      return null;
    } else if (name == null || number!.isEmpty) {
      return 'number required';
    }
    return null;
  }

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (!_showErrors || passwordValid) {
      return null;
    } else if (password == null || password!.isNotEmpty) {
      return 'Senha Obrigatória';
    } else {
      return 'Senha muito curta';
    }
  }

  @computed
  bool get retypePasswordValid =>
      retypePassword != null && retypePassword == password;
  String? get retypePasswordError {
    if (!_showErrors || retypePasswordValid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  @action
  Future<void> fetchZip(String zipFilter) async {
    _status = SignUpStatus.loading;
    _address = await ZipService().getAddressByZip(zipFilter);
    _status = SignUpStatus.loaded;
  }

  @computed
  bool get isFormValid =>
      nameValid && cpfValid && birthdateValid && emailValid && zipValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @action
  Future<void> register() async {}
}

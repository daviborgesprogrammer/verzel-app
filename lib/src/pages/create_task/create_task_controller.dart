import 'package:mobx/mobx.dart';
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
  bool showDeliveryDatePicker = false;

  @observable
  bool showConclusionDatePicker = false;

  @action
  void setTitle(String value) => title = value;

  @action
  void setDeliveryDate(String value) => deliveryDate = value;

  @action
  void setConclusionDate(String value) => conclusionDate = value;

  @action
  void setShowDeliveryDatePicker(bool value) => showDeliveryDatePicker = value;

  @action
  void setShowConclusionDatePicker(bool value) =>
      showConclusionDatePicker = value;

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
    // if (deliveryDateValid) {
    //   return null;
    // } else {
    //   return 'Select delivery date';
    // }
    return '$_showErrors';
    // if (!_showErrors || deliveryDateValid) {
    //   return null;
    // }
    // } else {
    //   return 'Select delivery date';
    // }
    // return !_showErrors ? null : 'xyz';
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid => titleValid && deliveryDateValid;

  @computed
  dynamic get sendPressed => isFormValid ? registerTask : null;

  @action
  Future<void> registerTask() async {}
}

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../core/extensions/form_unfocus.dart';
import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/logo_text.dart';
import '../../core/widgets/messages.dart';
import '../../core/widgets/verzel_text_field.dart';
import '../../models/address_model.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Loader, Messages {
  final SignUpController controller = SignUpController();
  DateTime _selectedDate = DateTime.now();
  var dateFormat = DateFormat('MM/dd/yyyy');
  final dateEC = TextEditingController();
  final publicPlaceEC = TextEditingController();
  final neighborhoodEC = TextEditingController();
  final stateEC = TextEditingController();

  @override
  void dispose() {
    dateEC.dispose();
    publicPlaceEC.dispose();
    neighborhoodEC.dispose();
    stateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoText(title: 'Sign up'),
              const SizedBox(height: 32),
              Text(
                'Personal Information',
                style: context.textStyles.textBold
                    .copyWith(fontSize: 20, color: ColorsApp.i.primary),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Name',
                  hint: 'Type your name',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'CPF',
                  hint: 'Type your CPF',
                  errorText: controller.cpfError,
                  onChanged: controller.setCPF,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => VerzelTextField(
                  controller: dateEC,
                  title: 'Birthdate',
                  hint: 'Select a date',
                  readOnly: true,
                  errorText: controller.birthdateError,
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    controller.setShowDatePicker(true);
                    context.unfocus();
                  },
                  suffixIcon: Icon(
                    Icons.date_range,
                    color: ColorsApp.i.primary,
                  ),
                ),
              ),
              Observer(
                builder: (_) => Offstage(
                  offstage: !controller.showDatePicker,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorsApp.i.backgroundDark,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 40),
                          height: 250,
                          child: ScrollDatePicker(
                            maximumDate: DateTime.now()
                                .subtract(const Duration(days: 12 * 365)),
                            options: DatePickerOptions(
                              backgroundColor: ColorsApp.i.backgroundDark,
                            ),
                            selectedDate: controller.birthdate != null
                                ? dateFormat.parse(controller.birthdate!)
                                : DateTime.now()
                                    .subtract(const Duration(days: 12 * 365)),
                            locale: const Locale('en'),
                            onDateTimeChanged: (DateTime value) {
                              _selectedDate = value;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                controller.setShowDatePicker(false);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                final date = dateFormat.format(_selectedDate);
                                controller.setBirthdate(date);
                                dateEC.text = date;
                                controller.setShowDatePicker(false);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Email',
                  hint: 'Type your email',
                  errorText: controller.emailError,
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Address',
                style: context.textStyles.textBold
                    .copyWith(fontSize: 20, color: ColorsApp.i.primary),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Zip code',
                  hint: 'Type your zip code',
                  errorText: controller.zipError,
                  onChanged: (value) async {
                    await controller.setZip(value);
                    if (value.length >= 10) {
                      final Address(:publicPlace, :neighborhood, :state) =
                          controller.address!;
                      publicPlaceEC.text = publicPlace ?? '';
                      neighborhoodEC.text = neighborhood ?? '';
                      stateEC.text = state ?? '';
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 8),
              VerzelTextField(
                controller: publicPlaceEC,
                title: 'Public place',
                hint: 'Public place',
                readOnly: true,
              ),
              const SizedBox(height: 8),
              VerzelTextField(
                controller: neighborhoodEC,
                title: 'Neighborhood',
                hint: 'Neighborhood',
                readOnly: true,
              ),
              const SizedBox(height: 8),
              VerzelTextField(
                controller: stateEC,
                title: 'State',
                hint: 'State',
                readOnly: true,
              ),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Number',
                  hint: 'Nº',
                  errorText: controller.numberError,
                  onChanged: controller.setNumber,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Authentication',
                style: context.textStyles.textBold
                    .copyWith(fontSize: 20, color: ColorsApp.i.primary),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Password',
                  errorText: controller.passwordError,
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  obscure: true,
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Retype password',
                  errorText: controller.retypePasswordError,
                  onChanged: controller.setRetypePass,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscure: true,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 56,
                width: context.screenWidth,
                child: GestureDetector(
                  onTap: controller.invalidSendPressed,
                  child: ElevatedButton(
                    onPressed: controller.sendPressed,
                    child: const Text('REGISTER'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

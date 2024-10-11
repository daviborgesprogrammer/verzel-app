import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../core/extensions/form_unfocus.dart';
import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/logo_text.dart';
import '../../core/widgets/messages.dart';
import '../../core/widgets/verzel_text_field.dart';
import 'sign_up_controller.dart';
import 'widgets/date_field.dart';
import 'widgets/password_session.dart';
import 'package:mobx/mobx.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Loader, Messages {
  final SignUpController controller = SignUpController();
  late final ReactionDisposer statusDisposer;

  final dateEC = TextEditingController();
  var dateFormat = DateFormat('MM/dd/yyyy');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case SignUpStatus.initial:
            hideLoader();
            break;
          case SignUpStatus.loading:
            showLoader();
            break;
          case SignUpStatus.loaded:
            hideLoader();
            break;
          case SignUpStatus.saved:
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/login');
            break;
          case SignUpStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    dateEC.dispose();
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
                  title: 'Email',
                  hint: 'Type your email',
                  errorText: controller.emailError,
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => DateField(
                  controllerText: dateEC,
                  title: 'Birthdate',
                  hint: 'Select a date',
                  readOnly: true,
                  controller: controller,
                  onTap: () {
                    controller.setShowDatePicker(true);
                    context.unfocus();
                  },
                  offstage: !controller.showDatePicker,
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
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Observer(
                builder: (_) => controller.address == null ||
                        controller.address?.zipCode == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorsApp.i.backgroundDark,
                            ),
                            child: Text(
                              '${controller.address?.publicPlace ?? ''}, ${controller.address?.neighborhood ?? ''}, ${controller.address?.state ?? ''}',
                              style: context.textStyles.textBold.copyWith(
                                fontSize: 12,
                                color: ColorsApp.i.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 8),
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
              PasswordSession(controller: controller),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => SizedBox(
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
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: context.textStyles.textRegular.copyWith(
                        color: ColorsApp.i.textDark,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: context.textStyles.textBold.copyWith(
                            color: ColorsApp.i.primaryLight,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
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

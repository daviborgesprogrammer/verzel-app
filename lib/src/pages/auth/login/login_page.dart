import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/loader.dart';
import '../../../core/widgets/logo_text.dart';
import '../../../core/widgets/messages.dart';
import '../../../core/widgets/verzel_text_field.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final LoginController controller = LoginController();
  late final ReactionDisposer statusDisposer;
  bool visiblePassword = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case LoginStatus.initial:
            hideLoader();
            break;
          case LoginStatus.loading:
            showLoader();
            break;
          case LoginStatus.success:
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/taskList');
            break;
          case LoginStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    super.initState();
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
              const LogoText(title: 'Sign in'),
              const SizedBox(height: 72),
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
              const SizedBox(height: 16),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Password',
                  hint: 'Type your password',
                  errorText: controller.passwordError,
                  onChanged: controller.setPassword,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  obscure: visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      visiblePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 18, 16, 18),
                  child: Text(
                    'Forgot password?',
                    style: context.textStyles.textBold
                        .copyWith(fontSize: 12, color: ColorsApp.i.primary),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Observer(
                builder: (_) => SizedBox(
                  height: 56,
                  width: context.screenWidth,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      onPressed: controller.sendPressed,
                      child: const Text('LOGIN'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have An Account?',
                      style: context.textStyles.textRegular
                          .copyWith(fontSize: 12, color: ColorsApp.i.textDark),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacementNamed('/signup');
                      },
                      child: Text(
                        'SIGN UP',
                        style: context.textStyles.textBold
                            .copyWith(fontSize: 24, color: ColorsApp.i.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

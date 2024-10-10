import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/verzel_text_field.dart';
import '../sign_up_controller.dart';

class PasswordSession extends StatefulWidget {
  final SignUpController controller;
  const PasswordSession({super.key, required this.controller});

  @override
  State<PasswordSession> createState() => _PasswordSessionState();
}

class _PasswordSessionState extends State<PasswordSession> {
  bool visiblePassword = true;
  bool visiblereTypePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            hint: 'Type your password',
            errorText: widget.controller.passwordError,
            onChanged: widget.controller.setPassword,
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
        const SizedBox(height: 8),
        Observer(
          builder: (_) => VerzelTextField(
            title: 'Confirm password',
            hint: 'Confirm your password',
            errorText: widget.controller.retypePasswordError,
            onChanged: widget.controller.setRetypePass,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            obscure: visiblereTypePassword,
            suffixIcon: IconButton(
              icon: Icon(
                visiblereTypePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  visiblereTypePassword = !visiblereTypePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

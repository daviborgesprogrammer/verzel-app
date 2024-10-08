import 'package:flutter/material.dart';

import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/logo_text.dart';
import '../../core/widgets/verzel_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoText(title: 'Sign in'),
            const SizedBox(height: 72),
            const VerzelTextField(title: 'Name', hint: 'Type your name'),
            const SizedBox(height: 16),
            const VerzelTextField(title: 'Email', hint: 'Type your email'),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: context.textStyles.textBold.copyWith(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 56,
              width: context.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
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
    );
  }
}

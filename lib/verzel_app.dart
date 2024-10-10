import 'package:flutter/material.dart';

import 'src/core/ui/theme/theme_config.dart';
import 'src/pages/login/login_page.dart';
import 'src/pages/signUp/sign_up_page.dart';

class VerzelApp extends StatelessWidget {
  const VerzelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verzel App',
      theme: ThemeConfig.theme,
      initialRoute: '/signup',
      routes: {
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignUpPage(),
      },
    );
  }
}

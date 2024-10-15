import 'package:flutter/material.dart';

import 'src/core/ui/theme/theme_config.dart';
import 'src/pages/auth/login/login_page.dart';
import 'src/pages/auth/signUp/sign_up_page.dart';
import 'src/pages/task_list/task_list_page.dart';

class VerzelApp extends StatelessWidget {
  const VerzelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verzel App',
      theme: ThemeConfig.theme,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignUpPage(),
        '/taskList': (_) => const TaskListPage(),
      },
    );
  }
}

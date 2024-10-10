import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/services/user/user_service.dart';
import 'verzel_app.dart';

void main() async {
  await buildApp();
}

Future<void> buildApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  runApp(const VerzelApp());
}

Future<void> setupLocators() async {
  GetIt.I.registerLazySingleton(() => UserService());
}

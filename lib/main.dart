import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/core/storage/storage.dart';
import 'src/pages/auth/auth_controller.dart';
import 'src/services/task/task_service.dart';
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
  GetIt.I.registerLazySingleton(() => Storage());
  GetIt.I.registerLazySingleton(() => AuthController());
  GetIt.I.registerLazySingleton(() => UserService());
  GetIt.I.registerLazySingleton(() => TaskService());
}

import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsApp.i.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.i.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.i.primaryButton),
    inputDecorationTheme: AppStyles.i.decorationInput,
  );
}

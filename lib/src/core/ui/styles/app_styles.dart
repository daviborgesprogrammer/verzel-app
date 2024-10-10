import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_style.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: ColorsApp.i.primary,
        textStyle: TextStyles.i.textButtonLabel,
      );
  InputDecorationTheme get decorationInput => InputDecorationTheme(
        fillColor: ColorsApp.i.background,
        filled: true,
        isDense: false,
        contentPadding: const EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: TextStyles.i.textRegular.copyWith(color: Colors.black),
        errorStyle: TextStyles.i.textRegular.copyWith(color: Colors.redAccent),
      );

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(color: Colors.grey.shade400),
  );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}

import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'lato';

  TextStyle get textThin =>
      TextStyle(fontWeight: FontWeight.w100, fontFamily: font);

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w100, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.w700, fontFamily: font);

  TextStyle get textBlack =>
      TextStyle(fontWeight: FontWeight.w900, fontFamily: font);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 16);

  TextStyle get textTitle => textBlack.copyWith(fontSize: 28);
}

extension TextStyleExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}

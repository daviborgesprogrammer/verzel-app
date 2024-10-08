import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get background => const Color(0XFFF4F8FB);
  Color get backgroundDark => const Color(0XFFCFD8DC);
  Color get primaryLight => const Color(0XFF118C6D);
  Color get primary => const Color(0XFF007363);
  Color get primaryDark => const Color(0XFF004D40);

  Color get textDark => const Color(0XFF263238);
  Color get text => const Color(0XFF607D8B);

  Color get delete => const Color(0XFFFE4A49);
  Color get edit => const Color(0XFF21B7CA);
  Color get view => const Color(0XFF7BC043);
  Color get conclude => const Color(0XFF0392CF);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}

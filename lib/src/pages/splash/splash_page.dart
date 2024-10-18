import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/global/verzel_constants.dart';
import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../auth/auth_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthController _authCtrl = GetIt.I<AuthController>();
  late ReactionDisposer statusDisposed;
  bool _logged = false;
  late int timeInit;
  late int timeEnd;

  @override
  void initState() {
    timeInit = DateTime.now().millisecondsSinceEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _authCtrl.getCurrentUser();
      statusDisposed = when((_) => _authCtrl.isLoggedIn, () async {
        if (_authCtrl.user != null) {
          _logged = true;
        }
      });
      startSplashScreenTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposed();
    super.dispose();
  }

  Timer startSplashScreenTimer() {
    timeEnd = DateTime.now().millisecondsSinceEpoch;
    final int timeResult = timeEnd - timeInit;
    int timeDiff = 0;
    if (timeResult < 3000) {
      timeDiff = 3000 - timeResult;
    }
    final Duration duration = Duration(milliseconds: timeDiff);
    return Timer(duration, navigationToNextPage);
  }

  Future<void> navigationToNextPage() async {
    Navigator.of(context)
        .pushReplacementNamed(_logged ? '/taskList' : '/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.percentWidth(.35),
                child: Image.asset(
                  VerzelConstants.images.logo,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'TODO LIST',
                style: context.textStyles.textBold
                    .copyWith(fontSize: 36, color: ColorsApp.i.primaryDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

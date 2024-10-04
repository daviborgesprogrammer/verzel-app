import 'package:flutter/material.dart';

import '../constants/verzel_constants.dart';
import '../ui/size_extensions.dart';
import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

class LogoText extends StatelessWidget {
  final String title;
  const LogoText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, context.appTopHeight + 24, 24, 24),
      child: Row(
        children: [
          Image.asset(
            VerzelConstants.images.logo,
            width: 100,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: context.textStyles.textBold
                .copyWith(fontSize: 32, color: ColorsApp.i.primaryDark),
          ),
        ],
      ),
    );
  }
}

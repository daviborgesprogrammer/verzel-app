import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';

class TaskTileReadonly extends StatelessWidget {
  final String label;
  final String text;
  const TaskTileReadonly({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textStyles.textRegular.copyWith(
            color: ColorsApp.i.primaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: context.textStyles.textRegular.copyWith(
            color: ColorsApp.i.textDark,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

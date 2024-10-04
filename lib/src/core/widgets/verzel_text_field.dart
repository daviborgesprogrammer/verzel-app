import 'package:flutter/material.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

class VerzelTextField extends StatelessWidget {
  final String title;
  final String? hint;
  const VerzelTextField({super.key, required this.title, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              title,
              style: context.textStyles.textRegular
                  .copyWith(color: ColorsApp.i.textDark),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.textStyles.textRegular
                  .copyWith(fontSize: 12, color: ColorsApp.i.text),
            ),
          ),
        ],
      ),
    );
  }
}

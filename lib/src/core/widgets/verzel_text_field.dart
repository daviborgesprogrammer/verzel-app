import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

class VerzelTextField extends StatelessWidget {
  final String title;
  final String? hint;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final bool obscure;
  const VerzelTextField({
    super.key,
    required this.title,
    this.hint,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: controller,
          readOnly: readOnly,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onTap: onTap,
          onChanged: onChanged,
          style: context.textStyles.textRegular.copyWith(
            fontSize: 12,
            color: readOnly ? ColorsApp.i.text : ColorsApp.i.textDark,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textStyles.textRegular
                .copyWith(fontSize: 12, color: ColorsApp.i.text),
            errorText: errorText,
            suffixIcon: suffixIcon,
            filled: readOnly,
            fillColor: Colors.grey.shade200,
          ),
          obscureText: obscure,
        ),
      ],
    );
  }
}

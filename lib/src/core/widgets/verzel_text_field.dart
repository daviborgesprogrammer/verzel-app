import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

class VerzelTextField extends StatefulWidget {
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
  final String? initialData;
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
    this.initialData,
  });

  @override
  State<VerzelTextField> createState() => _VerzelTextFieldState();
}

class _VerzelTextFieldState extends State<VerzelTextField> {
  @override
  void initState() {
    if (widget.initialData != null) {
      widget.controller?.text = widget.initialData ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            widget.title,
            style: context.textStyles.textRegular
                .copyWith(color: ColorsApp.i.textDark),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          style: context.textStyles.textRegular.copyWith(
            fontSize: 12,
            color: widget.readOnly ? ColorsApp.i.text : ColorsApp.i.textDark,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: context.textStyles.textRegular
                .copyWith(fontSize: 12, color: ColorsApp.i.text),
            errorText: widget.errorText,
            suffixIcon: widget.suffixIcon,
            filled: widget.readOnly,
            fillColor: Colors.grey.shade200,
          ),
          obscureText: widget.obscure,
        ),
      ],
    );
  }
}

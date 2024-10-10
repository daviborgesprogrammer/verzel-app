import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/verzel_text_field.dart';
import '../sign_up_controller.dart';

class DateField extends StatefulWidget {
  final TextEditingController controllerText;
  final String title;
  final String hint;
  final bool readOnly;
  final GestureTapCallback onTap;
  final bool offstage;
  final SignUpController controller;
  const DateField({
    super.key,
    required this.controllerText,
    required this.title,
    required this.hint,
    this.readOnly = false,
    required this.onTap,
    required this.offstage,
    required this.controller,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();
  var dateFormat = DateFormat('MM/dd/yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerzelTextField(
          controller: widget.controllerText,
          title: 'Birthdate',
          hint: 'Select a date',
          readOnly: true,
          errorText: widget.controller.birthdateError,
          textInputAction: TextInputAction.next,
          onTap: widget.onTap,
          suffixIcon: Icon(
            Icons.date_range,
            color: ColorsApp.i.primary,
          ),
        ),
        Offstage(
          offstage: widget.offstage,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorsApp.i.backgroundDark,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  height: 240,
                  child: ScrollDatePicker(
                    maximumDate:
                        DateTime.now().subtract(const Duration(days: 12 * 365)),
                    options: DatePickerOptions(
                      backgroundColor: ColorsApp.i.backgroundDark,
                    ),
                    selectedDate: widget.controller.birthdate != null
                        ? dateFormat.parse(widget.controller.birthdate!)
                        : DateTime.now()
                            .subtract(const Duration(days: 12 * 365)),
                    locale: const Locale('en'),
                    onDateTimeChanged: (DateTime value) {
                      selectedDate = value;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.controller.setShowDatePicker(false);
                      },
                      child: Container(
                        color: ColorsApp.i.backgroundDark,
                        height: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        child: Center(
                          child: Text(
                            'CANCEL',
                            style: context.textStyles.textBold
                                .copyWith(color: ColorsApp.i.primary),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final date = dateFormat.format(selectedDate);
                        widget.controller.setBirthdate(date);
                        widget.controllerText.text = date;
                        widget.controller.setShowDatePicker(false);
                      },
                      child: Container(
                        color: ColorsApp.i.backgroundDark,
                        height: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        child: Center(
                          child: Text(
                            'OK',
                            style: context.textStyles.textBold
                                .copyWith(color: ColorsApp.i.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

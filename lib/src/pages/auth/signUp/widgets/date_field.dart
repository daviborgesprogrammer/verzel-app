import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../../core/extensions/form_unfocus.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_style.dart';
import '../../../../core/widgets/verzel_text_field.dart';

class DateField extends StatefulWidget {
  final TextEditingController controllerText;
  final String title;
  final String hint;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final String? initialDate;
  final bool isBirthdate;
  const DateField({
    super.key,
    required this.controllerText,
    required this.title,
    required this.hint,
    this.errorText,
    required this.onChanged,
    required this.initialDate,
    this.isBirthdate = false,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();
  var dateFormat = DateFormat('MM/dd/yyyy');
  ValueNotifier<bool> showDatePicker = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerzelTextField(
          controller: widget.controllerText,
          title: widget.title,
          hint: widget.hint,
          readOnly: true,
          errorText: widget.errorText,
          textInputAction: TextInputAction.next,
          onTap: () {
            showDatePicker.value = true;
            context.unfocus();
          },
          suffixIcon: Icon(
            Icons.date_range,
            color: ColorsApp.i.primary,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: showDatePicker,
          builder: (_, show, __) => Offstage(
            offstage: !show,
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
                      maximumDate: DateTime(
                        widget.isBirthdate
                            ? DateTime.now().year
                            : DateTime.now().year + 5,
                        12,
                        31,
                      ),
                      options: DatePickerOptions(
                        backgroundColor: ColorsApp.i.backgroundDark,
                      ),
                      selectedDate: widget.initialDate != null
                          ? dateFormat.parse(widget.initialDate!)
                          : DateTime(
                              widget.isBirthdate
                                  ? selectedDate.year - 12
                                  : selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                            ),
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
                          showDatePicker.value = false;
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
                          if (widget.onChanged != null) {
                            widget.onChanged!(date);
                          }
                          widget.controllerText.text = date;
                          showDatePicker.value = false;
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
        ),
      ],
    );
  }
}

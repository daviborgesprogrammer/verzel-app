import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/verzel_text_field.dart';
import '../create_task_controller.dart';

class DateFieldConclusion extends StatefulWidget {
  final TextEditingController controllerText;
  final String title;
  final String hint;
  final bool readOnly;
  final GestureTapCallback onTap;
  final bool offstage;
  final CreateTaskController controller;
  const DateFieldConclusion({
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
  State<DateFieldConclusion> createState() => _DateFieldConclusionState();
}

class _DateFieldConclusionState extends State<DateFieldConclusion> {
  DateTime selectedDate = DateTime.now();
  var dateFormat = DateFormat('MM/dd/yyyy');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerzelTextField(
          controller: widget.controllerText,
          title: widget.title,
          hint: 'Select a date',
          readOnly: true,
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
                    maximumDate: DateTime(DateTime.now().year, 12, 31),
                    options: DatePickerOptions(
                      backgroundColor: ColorsApp.i.backgroundDark,
                    ),
                    selectedDate: widget.controller.conclusionDate != null
                        ? dateFormat.parse(widget.controller.conclusionDate!)
                        : DateTime(
                            selectedDate.year - 12,
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
                        widget.controller.setShowConclusionDatePicker(false);
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
                        widget.controller.setConclusionDate(date);
                        widget.controllerText.text = date;
                        widget.controller.setShowConclusionDatePicker(false);
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

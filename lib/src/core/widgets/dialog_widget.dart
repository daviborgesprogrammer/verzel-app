import 'package:flutter/material.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

enum DialogType {
  success,
  error,
  confirm,
}

class DialogWidget extends StatelessWidget {
  final String title, description, buttonText;
  final Image? image;
  final DialogType dialogType;
  final VoidCallback? onTap;
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
    required this.dialogType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          dialogContent(context),
          circleIcon(),
        ],
      ),
    );
  }

  Widget circleIcon() {
    return Positioned(
      left: 16.0,
      right: 16.0,
      child: CircleAvatar(
        backgroundColor: switch (dialogType) {
          DialogType.confirm => ColorsApp.i.primary,
          DialogType.success => Colors.greenAccent,
          DialogType.error => Colors.redAccent,
        },
        radius: 50.0,
        child: CircleAvatar(
          radius: 45.0,
          backgroundColor: switch (dialogType) {
            DialogType.confirm => ColorsApp.i.primaryLight,
            DialogType.success => Colors.greenAccent.shade200,
            DialogType.error => Colors.redAccent.shade200,
          },
          child: Icon(
            switch (dialogType) {
              DialogType.confirm => Icons.warning_amber,
              DialogType.success => Icons.check,
              DialogType.error => Icons.close
            },
            color: Colors.white,
            size: 56,
          ),
        ),
      ),
    );
  }

  Widget dialogContent(BuildContext context) {
    final Color color = switch (dialogType) {
      DialogType.confirm => ColorsApp.i.primaryLight,
      DialogType.success => Colors.greenAccent,
      DialogType.error => Colors.redAccent,
    };
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 40 + 16, 16, 16),
      margin: const EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: color, width: 10),
          bottom: BorderSide(color: color, width: 5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: context.textStyles.textBold.copyWith(
              fontSize: 28.0,
              color: color,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            color: color,
            height: 1,
            width: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: context.textStyles.textRegular
                  .copyWith(color: ColorsApp.i.text),
            ),
          ),
          const SizedBox(height: 32.0),
          Align(
            alignment: Alignment.bottomRight,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Offstage(
                    offstage: dialogType != DialogType.confirm,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 48,
                        width: (constraints.maxWidth / 2) - 4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'CANCEL',
                          style: context.textStyles.textRegular
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 48,
                      width: dialogType != DialogType.confirm
                          ? constraints.maxWidth
                          : (constraints.maxWidth / 2) - 4,
                      color: color,
                      alignment: Alignment.center,
                      child: Text(
                        buttonText.toUpperCase(),
                        style: context.textStyles.textRegular
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

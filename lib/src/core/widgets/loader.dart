import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  Future<void> showLoader() async {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return LoadingAnimationWidget.inkDrop(
            color: Colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}

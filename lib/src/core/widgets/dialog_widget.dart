import 'package:flutter/material.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_style.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Delete Task',
              style: context.textStyles.textBlack
                  .copyWith(color: Colors.redAccent.shade200, fontSize: 18),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Are you sure you want to delete this task? This action cannot be undone.',
                textAlign: TextAlign.center,
                style: context.textStyles.textRegular
                    .copyWith(color: ColorsApp.i.text, fontSize: 14),
              ),
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // child: SizedBox(
      //   height: 300,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const FlutterLogo(
      //         size: 150,
      //       ),
      //       const Text(
      //         'This is a Custom Dialog',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //         },
      //         child: const Text('Close'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

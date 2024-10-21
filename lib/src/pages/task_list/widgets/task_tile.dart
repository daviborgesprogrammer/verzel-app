import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (context) async {
              showDialog(
                context: context,
                builder: (context) => const DialogWidget(),
              );
            },
            backgroundColor: ColorsApp.i.delete,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: ColorsApp.i.edit,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: ColorsApp.i.view,
            foregroundColor: Colors.white,
            icon: Icons.visibility,
            label: 'View',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: ColorsApp.i.conclude,
            foregroundColor: Colors.white,
            icon: Icons.check_circle,
            label: 'Conclude',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorsApp.i.text,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              task.title ?? '',
              style: context.textStyles.textBold
                  .copyWith(fontSize: 16, color: ColorsApp.i.primaryDark),
            ),
            const SizedBox(height: 4),
            Offstage(
              offstage: task.deliveryDate?.isEmpty ?? true,
              child: Text(
                'Delivery:${task.deliveryDate}',
                style: context.textStyles.textRegular
                    .copyWith(fontSize: 12, color: ColorsApp.i.text),
              ),
            ),
            const SizedBox(height: 2),
            Offstage(
              offstage: task.conclusionDate?.isEmpty ?? true,
              child: Text(
                'Conclusion:${task.conclusionDate}',
                style: context.textStyles.textRegular
                    .copyWith(fontSize: 12, color: ColorsApp.i.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

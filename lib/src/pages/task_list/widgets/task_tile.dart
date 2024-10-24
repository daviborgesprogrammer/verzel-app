import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_style.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(int)? onDelete;
  final Function(int)? onConclude;
  const TaskTile(this.task, {this.onDelete, this.onConclude, super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(task.id),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (context) async {
              showDialog(
                context: context,
                builder: (context) => DialogWidget(
                  title: 'Excluir tarefa',
                  description:
                      'Tem certeza de que deseja excluir esta tarefa? Esta ação não pode ser desfeita.',
                  buttonText: 'Excluir',
                  dialogType: DialogType.confirm,
                  onTap: () {
                    if (onDelete != null) {
                      onDelete!(task.id!);
                    }
                  },
                ),
              );
            },
            backgroundColor: ColorsApp.i.delete,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Excluir',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        dragDismissible: false,
        children: task.status == TaskStatus.active
            ? [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: ColorsApp.i.edit,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Editar',
                ),
                SlidableAction(
                  onPressed: (context) async {
                    showDialog(
                      context: context,
                      builder: (context) => DialogWidget(
                        title: 'Concluir tarefa',
                        description:
                            'Tem certeza de que deseja concluir esta tarefa? Esta ação não pode ser desfeita.',
                        buttonText: 'Concluir',
                        dialogType: DialogType.confirm,
                        onTap: () {
                          if (onConclude != null) {
                            onConclude!(task.id!);
                          }
                        },
                      ),
                    );
                  },
                  backgroundColor: ColorsApp.i.conclude,
                  foregroundColor: Colors.white,
                  icon: Icons.check_circle,
                  label: 'Concluir',
                ),
              ]
            : [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: ColorsApp.i.edit,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Editar',
                ),
              ],
      ),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: switch (task.status) {
              TaskStatus.active => Colors.white,
              TaskStatus.concluded => const Color(0XFFBDBDBD),
              TaskStatus.deleted => const Color(0XFFE57373),
              _ => Colors.white,
            },
            // color: concluded ? const Color(0XFFBDBDBD) : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                task.title ?? '',
                style: context.textStyles.textBold.copyWith(
                  fontSize: 16,
                  color: switch (task.status) {
                    TaskStatus.active => ColorsApp.i.primaryDark,
                    TaskStatus.concluded => const Color(0XFF4D4D4D),
                    TaskStatus.deleted => const Color(0XFFB71C1C),
                    _ => Colors.white,
                  },
                ),
              ),
              const SizedBox(height: 4),
              Offstage(
                offstage: task.deliveryDate?.isEmpty ?? true,
                child: Text(
                  'Entrega:${task.deliveryDate}',
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 12,
                    color: switch (task.status) {
                      TaskStatus.active => ColorsApp.i.text,
                      TaskStatus.concluded => const Color(0XFF8B8B8B),
                      TaskStatus.deleted => const Color(0XFFD32F2F),
                      _ => Colors.white,
                    },
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Offstage(
                offstage: task.conclusionDate?.isEmpty ?? true,
                child: Text(
                  'Conclusão:${task.conclusionDate}',
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 12,
                    color: switch (task.status) {
                      TaskStatus.active => ColorsApp.i.text,
                      TaskStatus.concluded => const Color(0XFF8B8B8B),
                      TaskStatus.deleted => const Color(0XFFD32F2F),
                      _ => Colors.white,
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

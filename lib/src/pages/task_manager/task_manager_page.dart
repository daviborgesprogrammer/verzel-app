import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/messages.dart';
import '../../core/widgets/verzel_text_field.dart';
import '../../models/task_model.dart';
import '../auth/auth_controller.dart';
import '../auth/signUp/widgets/date_field.dart';
import 'task_manager_controller.dart';
import 'widgets/task_tile_readonly.dart';

class TaskManagerPage extends StatefulWidget {
  final TaskManagerState states;
  final Task? task;
  const TaskManagerPage({
    required this.states,
    this.task,
    super.key,
  });

  @override
  State<TaskManagerPage> createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage>
    with Loader, Messages {
  final TaskManagerController controller = TaskManagerController();
  late final ReactionDisposer statusDisposer;
  final titleEC = TextEditingController();
  final deliveryEC = TextEditingController();
  final conclusionEC = TextEditingController();
  final _auth = GetIt.I<AuthController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setScreenStates(widget.states);
      switch (controller.screenStates) {
        case TaskManagerState.creation:
          controller.setTaskEdit(Task(idUser: _auth.user?.id));
          break;
        case TaskManagerState.preview:
          controller.setTask(widget.task!);
          break;
        case TaskManagerState.editing:
          controller.setTaskEdit(widget.task!);
          titleEC.text = controller.taskEdit?.title ?? '';
          deliveryEC.text = controller.taskEdit?.deliveryDate ?? '';
          conclusionEC.text = controller.taskEdit?.conclusionDate ?? '';

          break;
      }
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskManagerStatus.initial:
            hideLoader();
            break;
          case TaskManagerStatus.loading:
            showLoader();
            break;
          case TaskManagerStatus.save:
            hideLoader();
            Navigator.pop(context, true);
          case TaskManagerStatus.update:
            hideLoader();
            Navigator.pop(context, true);
            break;
          case TaskManagerStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    titleEC.dispose();
    deliveryEC.dispose();
    conclusionEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Observer(
          builder: (_) => AppBar(
            leading: IconButton(
              icon: Icon(
                controller.screenStates == TaskManagerState.creation ||
                        controller.screenStates == TaskManagerState.editing
                    ? Icons.close
                    : Icons.arrow_back,
                color: ColorsApp.i.primary,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            title: controller.screenStates == TaskManagerState.creation
                ? Text(
                    'Criar Tarefa',
                    style: context.textStyles.textBold
                        .copyWith(color: ColorsApp.i.primary),
                  )
                : null,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => Visibility(
                  visible: controller.screenStates != TaskManagerState.preview,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      controller.screenStates == TaskManagerState.creation
                          ? 'Nova tarefa'
                          : 'Editar tarefa',
                      style: context.textStyles.textBold.copyWith(
                        fontSize: 24,
                        color: ColorsApp.i.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) =>
                    controller.screenStates == TaskManagerState.preview
                        ? TaskTileReadonly(
                            label: 'Titulo',
                            text: controller.task?.title ?? '',
                          )
                        : VerzelTextField(
                            title: 'Título da tarefa',
                            hint: 'Digite o título da tarefa',
                            controller: titleEC,
                            initialData: controller.taskEdit?.title,
                            errorText: controller.titleError,
                            onChanged: controller.setTitle,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) =>
                    controller.screenStates == TaskManagerState.preview
                        ? TaskTileReadonly(
                            label: 'Data de Entrega',
                            text: controller.task?.deliveryDate ?? '',
                          )
                        : DateField(
                            controllerText: deliveryEC,
                            title: 'Data de entrega',
                            hint: 'Selecione uma data',
                            initialDate: controller.taskEdit?.deliveryDate,
                            onChanged: controller.setDeliveryDate,
                            errorText: controller.deliveryDateError,
                          ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) =>
                    controller.screenStates == TaskManagerState.preview
                        ? TaskTileReadonly(
                            label: 'Data de Conclusão',
                            text: controller.task?.conclusionDate ??
                                'Não informado',
                          )
                        : DateField(
                            controllerText: conclusionEC,
                            title: 'Data de Conclusão',
                            hint: 'Selecione uma data',
                            initialDate: controller.taskEdit?.conclusionDate,
                            onChanged: controller.setConclusionDate,
                          ),
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: controller.screenStates == TaskManagerState.preview,
                  replacement: Column(
                    children: [
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 56,
                        width: context.screenWidth,
                        child: GestureDetector(
                          onTap: controller.invalidSendPressed,
                          child: ElevatedButton(
                            onPressed: controller.sendPressed,
                            child: Text(
                              controller.screenStates ==
                                      TaskManagerState.editing
                                  ? 'ATUALIZAR'
                                  : 'CRIAR',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      TaskTileReadonly(
                        label: 'Status',
                        text: controller.task?.status?.label ?? '',
                      ),
                    ],
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

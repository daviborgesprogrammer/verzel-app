import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/global/verzel_constants.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/messages.dart';
import '../../models/task_model.dart';
import '../auth/auth_controller.dart';
import 'task_list_controller.dart';
import 'widgets/task_tile.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> with Loader, Messages {
  final TaskListController controller = TaskListController();
  final _auth = GetIt.I<AuthController>();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.setUserId(_auth.user?.id);

      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskListStatus.initial:
            hideLoader();
            break;
          case TaskListStatus.loading:
            showLoader();
            break;
          case TaskListStatus.loaded:
            hideLoader();
            break;
          case TaskListStatus.success:
            hideLoader();
            break;
          case TaskListStatus.logout:
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/auth/login');
            break;
          case TaskListStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      await controller.fetchTasks();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 93,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
          child: Row(
            children: [
              Image.asset(
                VerzelConstants.images.profile,
                width: 50,
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ola,',
                    style: context.textStyles.textRegular
                        .copyWith(fontSize: 12, color: ColorsApp.i.textDark),
                  ),
                  Text(
                    _auth.user?.name ?? '',
                    style: context.textStyles.textBold
                        .copyWith(fontSize: 12, color: ColorsApp.i.textDark),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.of(context)
                  .pushNamed('/create', arguments: '${_auth.user?.id}');
              if (result == true) {
                await controller.fetchTasks();
              }
            },
            icon: Icon(
              Icons.add,
              color: ColorsApp.i.primary,
            ),
          ),
          IconButton(
            onPressed: () async {
              await controller.logout();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: ColorsApp.i.primary,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => ListView.separated(
          itemCount: controller.taskCount,
          itemBuilder: (_, index) => TaskTile(
            controller.tasks[index],
            onDelete: (int value) async {
              final navigator = Navigator.of(context);
              await controller.delete(value);
              navigator.pop();
            },
            onConclude: (Task value) async {
              final navigator = Navigator.of(context);
              await controller.conclude(value);
              navigator.pop();
            },
          ),
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: ColorsApp.i.text,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_style.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/messages.dart';
import '../../core/widgets/verzel_text_field.dart';
import '../auth/signUp/widgets/date_field.dart';
import 'create_task_controller.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> with Loader, Messages {
  late CreateTaskController controller = CreateTaskController();
  late final ReactionDisposer statusDisposer;
  final deliveryEC = TextEditingController();
  final conclusionEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ModalRoute.of(context)?.settings.arguments as String?;
      controller.setUserId(userId ?? '');
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case CreateTaskStatus.initial:
            hideLoader();
            break;
          case CreateTaskStatus.loading:
            showLoader();
            break;
          case CreateTaskStatus.success:
            hideLoader();
            Navigator.pop(context);
          case CreateTaskStatus.error:
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
    deliveryEC.dispose();
    conclusionEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('create task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Tasks',
                style: context.textStyles.textBold.copyWith(
                  fontSize: 24,
                  color: ColorsApp.i.primary,
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) => VerzelTextField(
                  title: 'Task Title',
                  hint: 'Type title task',
                  errorText: controller.titleError,
                  onChanged: controller.setTitle,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => DateField(
                  controllerText: deliveryEC,
                  title: 'Delivery Date',
                  hint: 'Select a date',
                  initialDate: controller.deliveryDate,
                  onChanged: controller.setDeliveryDate,
                  errorText: controller.deliveryDateError,
                ),
              ),
              const SizedBox(height: 8),
              Observer(
                builder: (_) => DateField(
                  controllerText: conclusionEC,
                  title: 'Conclusion Date',
                  hint: 'Select a date',
                  initialDate: controller.conclusionDate,
                  onChanged: controller.setConclusionDate,
                ),
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => SizedBox(
                  height: 56,
                  width: context.screenWidth,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      onPressed: controller.sendPressed,
                      child: const Text('CREATE TASK'),
                    ),
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

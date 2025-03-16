import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_worker_tags_cubit/get_all_worker_tags_cubit.dart';

import 'worker_register_upload_image_page_view_body.dart';

class WorkerRegisterUploadImagePageView extends StatefulWidget {
  const WorkerRegisterUploadImagePageView({Key? key}) : super(key: key);

  @override
  State<WorkerRegisterUploadImagePageView> createState() =>
      _WorkerRegisterUploadImagePageViewState();
}

class _WorkerRegisterUploadImagePageViewState
    extends State<WorkerRegisterUploadImagePageView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllWorkerTagsCubit>(context).getAllWorkerTags();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(child: WorkerRegisterUploadImagePageViewBody()));
  }
}

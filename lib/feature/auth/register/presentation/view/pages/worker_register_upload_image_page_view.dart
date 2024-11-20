import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'worker_register_upload_image_page_view_body.dart';

class WorkerRegisterUploadImagePageView extends StatelessWidget {
  const WorkerRegisterUploadImagePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: WorkerRegisterUploadImagePageViewBody());
  }
}

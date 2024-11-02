import 'package:flutter/material.dart';

import 'worker_and_client_register_page_view_body.dart';

class WorkerAndClientRegisterPageView extends StatelessWidget {
  const WorkerAndClientRegisterPageView({Key? key, required this.isWorkerAuth})
      : super(key: key);
  final bool isWorkerAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WorkerAndClientRegisterPageViewBody(
      isWorkerAuth: isWorkerAuth,
    )));
  }
}

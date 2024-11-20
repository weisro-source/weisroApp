import 'package:flutter/material.dart';

import 'package:weisro/feature/auth/register/presentation/view/pages/second_worker_and_client_register_page_view_body.dart';

class SecondWorkerAndClientRegisterPageView extends StatelessWidget {
  const SecondWorkerAndClientRegisterPageView(
      {Key? key, required this.isWorkerAuth})
      : super(key: key);
  final bool isWorkerAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SecondWorkerAndClientRegisterPageViewBody(
      isWorkerAuth: isWorkerAuth,
    ));
  }
}

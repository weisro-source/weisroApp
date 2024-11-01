import 'package:flutter/material.dart';

import 'client_register_page_view_body.dart';

class ClientRegisterPageView extends StatelessWidget {
  const ClientRegisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ClientRegisterPageViewBody()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/notifications/presentation/manager/get_all_user_notification_cubit_cubit/get_all_user_notification.dart';
import 'package:weisro/feature/notifications/presentation/view/pages/notifications_page_view_body.dart';

class NotificationsPageView extends StatelessWidget {
  const NotificationsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllUserNotificationCubit(),
      child: const Scaffold(body: SafeArea(child: NotificationsPageViewBody())),
    );
  }
}

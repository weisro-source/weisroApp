import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_register_upload_image_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../../core/widgets/days_list.dart';
import '../widgets/favorite_time_grid_view_widget.dart';
import '../widgets/favorite_time_question_widget.dart';
import '../widgets/question_widget.dart';

class WorkerRegisterDaySelectedBody extends StatefulWidget {
  const WorkerRegisterDaySelectedBody({super.key});

  @override
  State<WorkerRegisterDaySelectedBody> createState() =>
      _WorkerRegisterDaySelectedBodyState();
}

class _WorkerRegisterDaySelectedBodyState
    extends State<WorkerRegisterDaySelectedBody> {
  late StreamSubscription<List<String>> workerDaySubscription;
  @override
  void initState() {
    super.initState();
    final registerCubit = context.read<RegisterCubit>();
    final workerDayCubit = context.read<WorkerDayCubit>();
    workerDaySubscription = workerDayCubit.stream.listen((days) {
      registerCubit.updateSelectedDays(List<String>.from(days));
    });
  }

  @override
  void dispose() {
    workerDaySubscription.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
  
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Form(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: 35.kh,
            ),
            const SliverToBoxAdapter(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: LogoImageWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: 23.kh,
            ),
            LabeledBorderBox(label: S.of(context).Create_Worker_Account),
            SliverToBoxAdapter(
              child: 37.kh,
            ),
            SliverToBoxAdapter(
                child: SvgPicture.asset(IconsPath.iconsTimeSelected)),
            SliverToBoxAdapter(
              child: QuestionWidget(
                  icon: IconsPath.iconsCalender,
                  questionText: S.of(context).How_Many_Days),
            ),
            SliverToBoxAdapter(
              child: 10.kh,
            ),
            const SliverPadding(
              padding: EdgeInsetsDirectional.only(start: 24),
              sliver: DaysList(),
            ),
            SliverToBoxAdapter(
              child: 40.kh,
            ),
            const SliverToBoxAdapter(
              child: FavoriteTimeQuestionWidget(
                icon: IconsPath.iconsWatch,
              ),
            ),
            SliverToBoxAdapter(
              child: 12.kh,
            ),
            SliverPadding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 6),
              sliver: FavoriteTimeGridViewWidget(
                  isTime: true,
                  favoritesTime: WorkerTime.favoriteTimesList(context)),
            ),
            SliverToBoxAdapter(
              child: 40.kh,
            ),
            const SliverToBoxAdapter(
              child: FavoriteTimeQuestionWidget(icon: IconsPath.iconsFavTime),
            ),
            SliverToBoxAdapter(
              child: 12.kh,
            ),
            SliverPadding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 6),
              sliver: FavoriteTimeGridViewWidget(
                  isTime: false,
                  favoritesTime: WorkerTime.favoriteTimesList2(context)),
            ),
            SliverToBoxAdapter(
              child: 40.kh,
            ),
            SliverToBoxAdapter(
              child: AppButton(
                text: S.of(context).Next_Step,
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                    context,
                    (context) => BlocProvider.value(
                      value: registerCubit,
                      child: const WorkerRegisterUploadImagePageView(),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 42.kh,
            ),
          ],
        ),
      ),
    );
  }
}

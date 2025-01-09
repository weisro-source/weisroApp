import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/dashed_line_painter.dart';
import 'package:weisro/generated/l10n.dart';

class NotificationsPageViewBody extends StatelessWidget {
  const NotificationsPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Notifications),
        SliverToBoxAdapter(
          child: 44.kh,
        ),
        SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      width: 13,
                      height: 13,
                      IconsPath.iconsNotification,
                    ),
                    17.kw,
                    Flexible(
                      child: Text(
                        "You have a new message from John DoeCheck your inbox to read the full message.",
                        style: AppStyles.style12w400Grey(context)
                            .copyWith(height: 2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return Column(
              children: [
                21.kh,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomPaint(
                    painter: DashedLinePainter(
                      color: AppColors.second2Color,
                      dashWidth: 1.0,
                      dashSpace: 2.0,
                    ),
                    size: Size(MediaQuery.of(context).size.width, 2),
                  ),
                )
              ],
            );
          },
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        )
      ],
    );
  }
}

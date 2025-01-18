import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';
import 'package:weisro/feature/ads/presentation/managers/delete_ad_cubit/delete_ad_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/ads_widget_for_user.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/edit_ads_dialog.dart';
import 'package:weisro/generated/l10n.dart';

class UserPostsListView extends StatefulWidget {
  const UserPostsListView({
    super.key,
    required this.allUserAds,
  });

  final List<Docs> allUserAds;

  @override
  State<UserPostsListView> createState() => _UserPostsListViewState();
}

class _UserPostsListViewState extends State<UserPostsListView> {
  late List<Docs> userAds;

  @override
  void initState() {
    super.initState();
    userAds = List.from(widget.allUserAds);
  }

  void _deleteAd(int index) {
    if (index >= 0 && index < userAds.length) {
      setState(() {
        userAds.removeAt(index);
      });
    } else {
      debugPrint('Attempted to delete an item with an invalid index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 20.kh,
      itemCount: userAds.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Docs ad = userAds[index];
        return Dismissible(
          key: ValueKey(ad.id),
          background: Container(
            color: AppColors.greenColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 50,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 50,
            ),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              await showDialog(
                context: context,
                builder: (_) => EditAdDialog(
                  ad: ad,
                  onSave: (newText, newImage) {
                    setState(() {
                      userAds[index] = userAds[index].copyWith(
                        text: newText,
                        image: newImage,
                      );
                    });
                  },
                ),
              );
              return false;
            } else if (direction == DismissDirection.endToStart) {
              return await CustomDialog.showDeleteConfirmationDialog(
                  context,
                  S.of(context).Delete_Confirmation_Title,
                  S.of(context).Delete_Confirmation_Message);
            }
            return false;
          },
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              context.read<DeleteAdCubit>().deleteAd(ad.id ?? "");
              _deleteAd(index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(S.of(context).Ad_Deleted_Success),
                duration: const Duration(seconds: 3),
              ));
            }
          },
          child: SizedBox(
            width: double.infinity,
            child: AdsWidgetForUser(ad: ad),
          ),
        );
      },
    );
  }
}

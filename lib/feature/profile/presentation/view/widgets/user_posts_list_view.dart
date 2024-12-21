import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';
import 'package:weisro/feature/ads/presentation/managers/delete_ad_cubit/delete_ad_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/ads_widget_for_user.dart';
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
          direction: DismissDirection.endToStart,
          background: Container(
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
            return await CustomDialog.showDeleteConfirmationDialog(
                context,
                S.of(context).Delete_Confirmation_Title,
                S.of(context).Delete_Confirmation_Message);
          },
          onDismissed: (direction) {
            debugPrint('onDismissed called with index: $index');
            context.read<DeleteAdCubit>().deleteAd(ad.id ?? "");
            context.read<DeleteAdCubit>().stream.listen((state) {
              if (state is DeleteAdSuccess) {
                _deleteAd(index);
                if (context.mounted) {
                  var materialBanner =
                      CustomMaterialBanner.successMaterialBanner(
                          S.of(context).Ad_Deleted,
                          S.of(context).Ad_Deleted_Success);

                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);
                }
              } else if (state is DeleteAdFailures) {
                if (context.mounted) {
                  final materialBanner =
                      CustomMaterialBanner.failureMaterialBanner(
                          S.of(context).Ad_Deletion_Failed,
                          S.of(context).Ad_Deletion_Error);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);
                }
              }
            });
          },
          child:
              SizedBox(width: double.infinity, child: AdsWidgetForUser(ad: ad)),
        );
      },
    );
  }
}

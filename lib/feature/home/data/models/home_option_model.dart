import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/view/pages/categories_worker_services_page_view.dart';
import 'package:weisro/generated/l10n.dart';

class HomeOptionModel {
  final String title;
  final String icon;
  final bool workerShow;
  final void Function()? onTap;
  HomeOptionModel(this.onTap,
      {required this.title, required this.icon, required this.workerShow});
  static List<HomeOptionModel> homeOptionList(context) {
    return [
      HomeOptionModel(() {
        HelperFunctions.navigateToScreen(
            context,
            (context) => const CategoriesWorkerAndServicesPageView(
                  type: Constants.categoryTypeServices,
                ));
      },
          title: S.of(context).Rental_Services,
          icon: ImagePath.imagesService,
          workerShow: true),
      HomeOptionModel(() {
        HelperFunctions.navigateToScreen(
            context,
            (context) => const CategoriesWorkerAndServicesPageView(
                  type: Constants.categoryTypeWorker,
                ));
      },
          title: S.of(context).Rental_Workers,
          icon: ImagePath.imagesWorker,
          workerShow: false),
      HomeOptionModel(() {},
          title: "Game", icon: ImagePath.imagesGame, workerShow: true)
    ];
  }
}
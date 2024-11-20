import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/generated/l10n.dart';

class CategoryModel {
  final String title;
  final String icon;
  final bool workerShow;
  CategoryModel(
      {required this.title, required this.icon, required this.workerShow});

static  List<CategoryModel> categoryList(context) {
    return [
      CategoryModel(
          title: S.of(context).Rental_Services,
          icon: ImagePath.imagesService,
          workerShow: true),
      CategoryModel(
          title: S.of(context).Rental_Workers,
          icon: ImagePath.imagesWorker,
          workerShow: false),
      CategoryModel(title: "Game", icon: ImagePath.imagesGame, workerShow: true)
    ];
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/utils/constant.dart';

part 'view_type_in_home_page_state.dart';

class ViewTypeInHomePageCubit extends Cubit<ViewTypeInHomePageState> {
  ViewTypeInHomePageCubit() : super(ViewHomePageInitial());
  String viewType = "";
  String changeViewType(String type) {
    if (type == Constants.categoryTypeWorker) {
      viewType = Constants.categoryTypeWorker;

      return Constants.categoryTypeWorker;
    } else if (type == Constants.categoryTypeServices) {
      viewType = Constants.categoryTypeServices;

      return Constants.categoryTypeServices;
    } else {
      viewType = "";

      return "";
    }
  }

  void updateState() {
    emit(ChangeView());
  }
}

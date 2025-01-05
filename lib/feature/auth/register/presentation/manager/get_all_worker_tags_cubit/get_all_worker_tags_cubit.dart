import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/worker_tags_model.dart';

part 'get_all_worker_tags_state.dart';

class GetAllWorkerTagsCubit extends Cubit<GetAllWorkerTagsState> {
  GetAllWorkerTagsCubit() : super(GetAllWorkerTagsInitial());
  static GetAllWorkerTagsCubit get(context) => BlocProvider.of(context);
  List<Docs> selectedTags = [];
  Future<void> getAllWorkerTags() async {
    emit(GetAllWorkerTagsLoading());
    var result =
        await getIt.get<AuthenticationRepository>().getAllWorkerTagApi();
    result.fold(
      (errorInGetWorkerTags) {
        emit(GetAllWorkerTagsFailures(failure: errorInGetWorkerTags));
      },
      (getAllWorkerTags) {
        emit(GetAllWorkerTagsSuccess(allTags: getAllWorkerTags));
      },
    );
  }
}

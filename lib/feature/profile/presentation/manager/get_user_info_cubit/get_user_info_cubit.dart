import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  static GetUserInfoCubit get(context) => BlocProvider.of(context);

  Future<void> saveUserInfo() async {
    // if user Save is save  do nothing
    if (CacheHelper.getData(key: CacheKeys.kUserSave) != null &&
        CacheHelper.getData(key: CacheKeys.kUserSave)) {
      /// if need save user info
      // if (HelperFunctions.isDebugMode()) {
      //   await getUserClientInfo();
      // }

      log("User Info Already Saved");
      return;
    } else {
      await getUserClientInfo();
    }
  }

  Future<void> getUserClientInfo() async {
    emit(GetUserInfoLoading());
    var result = await getIt.get<AccountRepository>().getUserClintInfo();
    result.fold(
      (errorInGetUserInfo) async {
        await CacheHelper.setData(key: CacheKeys.kUserSave, value: false);

        emit(GetUserInfoFailures(error: errorInGetUserInfo));
      },
      (userInfo) async {
        await CacheHelper.cacheUserData(userInfo);
        await CacheHelper.setData(key: CacheKeys.kUserSave, value: true);
        emit(GetUserInfoSuccess(user: userInfo));
      },
    );
  }
}

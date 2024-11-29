import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';

part 'edit_user_info_state.dart';

class EditUserInfoCubit extends Cubit<EditUserInfoState> {
  EditUserInfoCubit() : super(EditUserInfoInitial());
  TextEditingController fullNameController = TextEditingController(
      text:
          "${CacheHelper.getData(key: CacheKeys.kUserFirstName)}${CacheHelper.getData(key: CacheKeys.kUserLastName)} ");

  TextEditingController emailController = TextEditingController(
      text: CacheHelper.getData(key: CacheKeys.kUserEmail));

  Future<void> initTextController() async {}
}

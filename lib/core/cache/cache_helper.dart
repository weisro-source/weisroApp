import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> cacheInit() async {
    debugPrint('init cash helper');
    sharedPreferences = await SharedPreferences.getInstance();

    // var lang = await getData(key: CacheKeys.kLang);
    // if (lang == null) {
    //   await setData(key: CacheKeys.kLang, value: 'en');
    // }
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> deleteData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> clearCache() async {
    await sharedPreferences.clear();
  }

  static cacheUserData(UserClientModel user) async {
    await CacheHelper.setData(
        key: CacheKeys.kUserFirstName, value: user.firstName);
    await CacheHelper.setData(
        key: CacheKeys.kUserLastName, value: user.lastName);
    await CacheHelper.setData(key: CacheKeys.kUserEmail, value: user.email);
    await CacheHelper.setData(key: CacheKeys.kUserPhone, value: user.phone);
    await CacheHelper.setData(
        key: CacheKeys.kCountryCode, value: user.countryCode);
    await CacheHelper.setData(
        key: CacheKeys.kUserStreet, value: user.address?.street);
    await CacheHelper.setData(
        key: CacheKeys.kHouseNumber, value: user.address?.houseNumber);
    await CacheHelper.setData(
        key: CacheKeys.kUserZipCode, value: user.address?.postalCode);
    await CacheHelper.setData(
        key: CacheKeys.kCityName, value: user.address?.city ?? "");
    await CacheHelper.setData(
        key: CacheKeys.kCountryName, value: user.address?.country ?? "");
    await CacheHelper.setData(key: CacheKeys.kUserId, value: user.userId);
    await CacheHelper.setData(key: CacheKeys.kUserRole, value: user.role?.name);
  }
}

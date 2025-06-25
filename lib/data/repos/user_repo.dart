import 'dart:developer';

import 'package:balanced_meal/core/helper/database_helper.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/*
final userRepoProvider = Provider<UserRepo>((ref) {
  return UserRepo();
});

class UserRepo {
  final dbHelper = DatabaseHelper();

  Future<Response> saveUserCredentials(
      String firstName, String lastName) async {
    try {
      await Future.wait([
        dbHelper.save(AppConst.firstName, firstName),
        dbHelper.save(AppConst.lastName, lastName),
      ]);
      return Response.success(Strings.saveSuccess);
    } catch (e) {
      log('${Strings.saveFailed}: $e');
      return Response.error(Strings.saveFailed);
    }
  }

  static Future<String?> getFirstName() async {
    try {
      final dbHelper = DatabaseHelper();
      return await dbHelper.read(AppConst.firstName);
    } catch (e) {
      log('${Strings.getFirstNameFailed}: $e');
      return null;
    }
  }
}
*/

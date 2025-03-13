import 'package:fitness/core/consts/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountDataSource {
  final Dio dio;
  final SharedPreferences preferences;
  DeleteAccountDataSource({required this.dio, required this.preferences});
  Future<void> deleteAccount() async {
    await dio.get(UrlRoutes.deleteAccount,
        options: Options(headers: {
          "Authorization": "Bearer ${preferences.getString("access_token")}"
        }));
  }
}

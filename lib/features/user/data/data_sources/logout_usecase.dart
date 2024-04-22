import 'package:BodyPower/core/consts/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  LogOutUseCase({required this.dio, required this.prefs});
  Future<void> logOut() async {
    await dio.post(UrlRoutes.logOut,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    prefs.clear();
  }
}

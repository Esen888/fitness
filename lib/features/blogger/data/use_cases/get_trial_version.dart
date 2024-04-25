import 'package:BodyPower/core/consts/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTrialVersionUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetTrialVersionUseCase({required this.dio, required this.prefs});
  Future<void> getTrialVersion({required int courseId}) async {
    await dio.get("${UrlRoutes.getTrialVersion}course_id=$courseId",
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
  }
}

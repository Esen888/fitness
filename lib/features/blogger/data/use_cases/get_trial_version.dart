import 'package:BodyPower/core/consts/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTrialVersionUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetTrialVersionUseCase({required this.dio, required this.prefs});
  Future<void> getTrialVersion({required int courseId}) async {
    await dio.get(UrlRoutes.getTrialVersion, queryParameters: {
      "course_id": courseId,
    });
  }
}

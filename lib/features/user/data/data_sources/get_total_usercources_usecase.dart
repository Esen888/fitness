import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/user/data/models/total_courses_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotalUserCoursesUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  TotalUserCoursesUseCase({required this.dio, required this.prefs});
  Future<TotalUserCousesModel> getTotalCourses() async {
    final Response response = await dio.get(UrlRoutes.usersCourses,
        options: Options(
            headers: {"Authorization": "Bearer ${prefs.getString("access_token")}"}));
    return TotalUserCousesModel.fromJson(response.data);
  }
}

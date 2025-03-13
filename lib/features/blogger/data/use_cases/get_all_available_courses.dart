import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/blogger/data/models/available_courses_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllAvailableCoursesUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetAllAvailableCoursesUseCase({required this.dio, required this.prefs});
  Future<AvailableCoursesModel> getAvailableCourses() async {
    final Response response = await dio.get(UrlRoutes.allCourses,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    return AvailableCoursesModel.fromJson(response.data);
  }
}

import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/user/data/models/course_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesUseCase {
  final Dio dio;
  final SharedPreferences preferences;
  CoursesUseCase({required this.dio, required this.preferences});
  Future<CourseModel> course({required int courseId}) async {
    final Response response = await dio.get(
        "${UrlRoutes.showCoursesInCalendar}/$courseId",
        options: Options(headers: {
          "Authorization": "Bearer ${preferences.getString("access_token")}"
        }));
    return CourseModel.fromJson(response.data);
  }
}

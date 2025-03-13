import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/user/data/models/user_courses_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCourseUseCase {
  final Dio dio;
  final SharedPreferences preferences;

  UserCourseUseCase({required this.dio, required this.preferences});
  Future<UserCoursesModel> getUserCourses({required int sectionId}) async {
    final Response response = await dio.get(
        "${UrlRoutes.usersCourses}/$sectionId",
        options: Options(headers: {
          "Authorization": "Bearer ${preferences.getString("access_token")}"
        }));
    return UserCoursesModel.fromJson(response.data);
  }
}

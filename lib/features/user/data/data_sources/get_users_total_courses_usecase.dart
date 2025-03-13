// import 'package:fitness/core/consts/url_routes.dart';
// import 'package:fitness/features/user/data/models/total_user_courses_model.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class GetUsersTotalCoursesUseCase {
//   final Dio dio;
//   final SharedPreferences preferences;
//   GetUsersTotalCoursesUseCase({required this.dio, required this.preferences});
//   Future<TotalUserCoursesModel> getUsersTotalCourses() async {
//     final Response response = await dio.get(UrlRoutes.usersCourses,
//         options: Options(headers: {
//           "Authorization": "Bearer ${preferences.getString("access_token")}"
//         }));
//     return TotalUserCoursesModel.fromJson(response.data);
//   }
// }

import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/blogger/data/models/list_of_courses_in_section.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetListOfCoursesInSectionUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetListOfCoursesInSectionUseCase({required this.dio, required this.prefs});
  Future<ListOfCoursesInSectionModel> getListOfCousesInSection(
      {required int id}) async {
    final Response response = await dio.get(
        "${UrlRoutes.listOfCoursesInSection}/$id",
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
        return ListOfCoursesInSectionModel.fromJson(response.data);
  }
}

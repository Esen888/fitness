import 'package:BodyPower/core/consts/url_routes.dart';
import 'package:BodyPower/features/blogger/data/models/guest_courses_model.dart';
import 'package:dio/dio.dart';

class GetCoursesForGuestsUseCase {
  final Dio dio;
  GetCoursesForGuestsUseCase({required this.dio});
  Future<CoursesForGuestsModel> getCourses() async {
    final Response response = await dio.get(UrlRoutes.coursesForGuests);
    return CoursesForGuestsModel.fromJson(response.data);
  }
}

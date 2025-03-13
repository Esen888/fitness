import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/blogger/data/models/payment_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyCourseUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  BuyCourseUseCase({required this.dio, required this.prefs});

  Future<PaymentModel> buyCourse({required int courseID}) async {
    final Response response = await dio.get(
        "${UrlRoutes.payment}?course_id=$courseID",
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    return PaymentModel.fromJson(response.data);
  }
}

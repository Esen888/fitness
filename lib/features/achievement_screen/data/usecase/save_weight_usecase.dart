import 'package:fitness/core/consts/url_routes.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveWeightUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  SaveWeightUseCase({required this.dio, required this.prefs});
  Future<void> saveWeight({required int weight}) async {
    await dio.post(UrlRoutes.saveWeightData,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }),
        data: {"weight": weight});
  }
}

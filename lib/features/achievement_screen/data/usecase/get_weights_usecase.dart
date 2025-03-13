import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/achievement_screen/data/models/weights_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetWeightsUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetWeightsUseCase({required this.dio, required this.prefs});
  Future<WeightsModel> getWeights() async {
    final Response response = await dio.get(UrlRoutes.getWeightsList,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    return WeightsModel.fromJson(response.data);
  }
}

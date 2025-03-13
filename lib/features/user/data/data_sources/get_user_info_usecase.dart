import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/user/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserInfoUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  GetUserInfoUseCase({required this.dio, required this.prefs});
  Future<UserProfileModel> getUserInfo() async {
    final Response response = await dio.get(UrlRoutes.userInfo,
        options: Options(headers: {
          "Authorization": "Bearer ${prefs.getString("access_token")}"
        }));
    return UserProfileModel.fromJson(response.data);
  }
}

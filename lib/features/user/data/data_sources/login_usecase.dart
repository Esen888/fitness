import 'package:fitness/core/consts/url_routes.dart';
import 'package:fitness/features/user/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  LoginUseCase({required this.dio, required this.prefs});

  Future<LoginModel> login(
      {required int phoneNumber, required int smsCode}) async {
    final Response response = await dio
        .post(UrlRoutes.logIn, data: {"phone": phoneNumber, "code": smsCode});
    final String token = response.data["access_token"];
 
    prefs.setString("access_token", token);

    return LoginModel.fromJson(response.data);
  }
}

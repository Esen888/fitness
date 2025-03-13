import 'package:fitness/core/consts/url_routes.dart';
import 'package:dio/dio.dart';

class AuthorizationUseCase {
  final Dio dio;

  AuthorizationUseCase({
    required this.dio,
  });
  Future<int> authorizationWithPhone({required String phoneNumber}) async {
    final Response response =
        await dio.post(UrlRoutes.getCode, data: {"phone": phoneNumber});
    final int smsCode = response.data["data"]["code"];
    return smsCode;
  }
}

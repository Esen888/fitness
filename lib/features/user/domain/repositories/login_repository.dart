import 'package:fitness/features/user/data/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> login({required int phoneNumber, required int smsCode});
}

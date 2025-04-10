import 'package:fitness/features/user/data/data_sources/login_usecase.dart';
import 'package:fitness/features/user/data/models/login_model.dart';
import 'package:fitness/features/user/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginUseCase useCase;
  LoginRepositoryImpl({required this.useCase});
  @override
  Future<LoginModel> login(
      {required String phoneNumber, required int smsCode}) async {
    return await useCase.login(phoneNumber: phoneNumber, smsCode: smsCode);
  }
}

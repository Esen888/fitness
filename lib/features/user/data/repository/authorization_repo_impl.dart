import 'package:BodyPower/features/user/data/data_sources/authorization_usecase.dart';
import 'package:BodyPower/features/user/domain/repositories/authorization_repo.dart';

class AuthorizationRepoImpl implements AuthorizationRepo {
  AuthorizationUseCase useCase;
  AuthorizationRepoImpl({required this.useCase});
  @override
  Future<int> authorizationWithPhone({required String phoneNumber}) async {
    return await useCase.authorizationWithPhone(phoneNumber: phoneNumber);
  }
}

import 'package:fitness/features/user/data/data_sources/authorization_usecase.dart';
import 'package:fitness/features/user/domain/repositories/authorization_repo.dart';

class AuthorizationRepoImpl implements AuthorizationRepo {
  AuthorizationUseCase useCase;
  AuthorizationRepoImpl({required this.useCase});
  @override
  Future<void> authorizationWithPhone({required String phoneNumber}) async {
     await useCase.authorizationWithPhone(phoneNumber: phoneNumber);
  }
}

import 'package:BodyPower/features/user/data/data_sources/logout_usecase.dart';
import 'package:BodyPower/features/user/domain/repositories/logout_repo.dart';

class LogOutRepoImpl implements LogOutRepo{
  LogOutUseCase useCase;
  LogOutRepoImpl({required this.useCase});
  @override
  Future<void> logOut()async {
   await useCase.logOut();
  }
  
}
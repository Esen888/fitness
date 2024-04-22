import 'package:BodyPower/features/user/data/data_sources/get_user_info_usecase.dart';
import 'package:BodyPower/features/user/data/models/user_model.dart';
import 'package:BodyPower/features/user/domain/repositories/get_user_info.dart';

class GetUserInfoRepoImpl implements GetUserInfoRepo {
  GetUserInfoUseCase useCase;
  GetUserInfoRepoImpl({required this.useCase});
  @override
  Future<UserProfileModel> getUserInfo() async {
    return await useCase.getUserInfo();
  }
}

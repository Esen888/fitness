import 'package:fitness/features/user/data/models/user_model.dart';

abstract class GetUserInfoRepo {
  Future<UserProfileModel> getUserInfo();
}

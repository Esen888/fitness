import '../../data/models/user_model_remove.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel user);
Future<void> getUserDetail();

}

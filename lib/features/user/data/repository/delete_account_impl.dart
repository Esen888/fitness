import 'package:BodyPower/features/user/data/data_sources/delete_account_ds.dart';
import 'package:BodyPower/features/user/domain/repositories/delete_account_repo.dart';

class DeleteAccountRepoImpl implements DeleteAccountRepo {
  DeleteAccountDataSource dataSource;
  DeleteAccountRepoImpl({required this.dataSource});
  @override
  Future<void> deleteAccount() async {
    await dataSource.deleteAccount();
  }
}

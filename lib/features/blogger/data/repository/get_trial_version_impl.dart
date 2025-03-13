import 'package:fitness/features/blogger/data/use_cases/get_trial_version.dart';
import 'package:fitness/features/blogger/domain/repositories/get_trial_version.dart';

class GetTrialVersionRepoImpl implements GetTrialVersionRepo {
  GetTrialVersionUseCase useCase;
  GetTrialVersionRepoImpl({required this.useCase});
  @override
  Future<void> getTrialVersion({required int courseId}) async {
    await useCase.getTrialVersion(courseId: courseId);
  }
}

import 'package:fitness/features/blogger/data/models/payment_model.dart';
import 'package:fitness/features/blogger/data/use_cases/buy_course_usecase.dart';
import 'package:fitness/features/blogger/domain/repositories/buy_course_repo.dart';

class BuyCourseRepoImpl implements BuyCourseRepo {
  BuyCourseUseCase useCase;
  BuyCourseRepoImpl({required this.useCase});
  @override
  Future<PaymentModel> buyCourse({required int courseID}) async {
    return await useCase.buyCourse(courseID: courseID);
  }
}

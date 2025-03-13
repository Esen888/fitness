import 'package:fitness/features/blogger/data/models/payment_model.dart';

abstract class BuyCourseRepo{
  Future<PaymentModel> buyCourse({required int courseID});
}
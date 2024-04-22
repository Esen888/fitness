import 'package:BodyPower/features/achievement_screen/data/models/weights_model.dart';

abstract class GetWeightsRepo{
  Future<WeightsModel> getWeights();
}
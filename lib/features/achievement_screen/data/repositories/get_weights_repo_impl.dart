import 'package:fitness/features/achievement_screen/data/models/weights_model.dart';
import 'package:fitness/features/achievement_screen/data/usecase/get_weights_usecase.dart';
import 'package:fitness/features/achievement_screen/domain/repositories/get_weights.dart';

class GetWeightsRepoImpl implements GetWeightsRepo {
  GetWeightsUseCase useCase;
  GetWeightsRepoImpl({required this.useCase});
  @override
  Future<WeightsModel> getWeights() async {
    return await useCase.getWeights();
  }
}

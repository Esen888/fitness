import 'package:fitness/features/achievement_screen/data/usecase/save_weight_usecase.dart';
import 'package:fitness/features/achievement_screen/domain/repositories/save_weight_repo.dart';

class SaveWeightRepoImpl implements SaveWeightRepo{
  SaveWeightUseCase  useCase;
  SaveWeightRepoImpl({required this.useCase});
  @override
  Future<void> saveWeight({required int weight})async {
   await useCase.saveWeight(weight: weight);
  }
  
  
}
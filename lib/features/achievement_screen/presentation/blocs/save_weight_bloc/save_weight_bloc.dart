import 'package:BodyPower/features/achievement_screen/data/repositories/save_weight_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'save_weight_event.dart';
part 'save_weight_state.dart';

class SaveWeightBloc extends Bloc<SaveWeightEvent, SaveWeightState> {
  SaveWeightRepoImpl repoImpl;
  SaveWeightBloc({required this.repoImpl}) : super(SaveWeightInitial()) {
    on<SaveWeightEvent>((event, emit) async {
      emit(SaveWeightLoading());
      try {
        await repoImpl.saveWeight(weight: event.weight);
        emit(SaveWeightSuccess());
      } catch (_) {
        emit(SaveWeightError());
      }
    });
  }
}

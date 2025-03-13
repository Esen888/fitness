import 'package:fitness/features/achievement_screen/data/models/weights_model.dart';
import 'package:fitness/features/achievement_screen/data/repositories/get_weights_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'get_weights_event.dart';
part 'get_weights_state.dart';

class GetWeightsBloc extends Bloc<GetWeightsEvent, GetWeightsState> {
  GetWeightsRepoImpl repoImpl;
  GetWeightsBloc({required this.repoImpl}) : super(GetWeightsInitial()) {
    on<GetWeightsEvent>((event, emit) async {
      emit(GetWeightsLoading());
      try {
        final result = await repoImpl.getWeights();

        emit(GetWeightsSuccess(model: result));
      } on DioException catch (e) {
        emit(GetWeightsError(exception: e));
      }
    });
  }
}

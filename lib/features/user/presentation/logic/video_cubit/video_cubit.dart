import 'package:BodyPower/features/user/data/models/video_model.dart';
import 'package:BodyPower/features/user/domain/use_case/videos_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideosUsecase _videoUsecase;
  VideoCubit(this._videoUsecase) : super(VideoInitialState());

  void getVideos({required String dayOfTheWeek}) async {
    emit(VideoLoadingState());
    try {
      final result = await _videoUsecase.getVideos(dayOfTheWeek: dayOfTheWeek);
      emit(VideoSuccessState(data: result));
    } catch (e) {
      emit(VideoErrorState(error: e.toString()));
    }
  }

  void finishWorkout(
      {required String dayOfTheWeek,
      required VideoModel model,
      required int index}) async {
    emit(VideoLoadingState());
    try {
      await _videoUsecase.finishWorkout(
        index: index,
        dayOfTheWeek: dayOfTheWeek,
        model: model,
      );
      emit(const VideoFinishSuccessState());
    } catch (e) {
      emit(VideoErrorState(error: e.toString()));
    }
  }
}

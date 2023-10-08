import 'package:BodyPower/features/user/data/models/video_model.dart';
import 'package:BodyPower/features/user/data/repository/video_repository_impl.dart';

class VideosUsecase {
  final _videoRepo = VideoRepositoryImpl();
  Future<List<VideoModel>> getVideos({required String dayOfTheWeek}) async =>
      await _videoRepo.getVideos(dayOfTheWeek: dayOfTheWeek);
  Future<void> finishWorkout(
          {required String dayOfTheWeek,
          required VideoModel model,
          required int index}) async =>
      await _videoRepo.finishWorkout(
          dayOfTheWeek: dayOfTheWeek, model: model, index: index);
}

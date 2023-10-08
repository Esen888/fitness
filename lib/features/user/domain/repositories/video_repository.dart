import 'package:BodyPower/features/user/data/models/video_model.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getVideos({required String dayOfTheWeek});
  Future<void> finishWorkout(
      {required String dayOfTheWeek,
      required VideoModel model,
      required int index});
}

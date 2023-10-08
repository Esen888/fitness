import 'dart:convert';
import 'package:BodyPower/features/user/data/models/video_model.dart';
import 'package:BodyPower/features/user/domain/repositories/video_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class VideoRepositoryImpl implements VideoRepository {
  final _database = FirebaseDatabase.instance;
  @override
  Future<List<VideoModel>> getVideos({required String dayOfTheWeek}) async {
    try {
      final response = await _database.ref(dayOfTheWeek).get();
      var encodeResponse = jsonEncode(response.value);
      List<dynamic> decodeResponse = jsonDecode(encodeResponse);
      List<VideoModel> result = decodeResponse.map((e) {
        return VideoModel.fromJson(e);
      }).toList();

      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> finishWorkout({
    required String dayOfTheWeek,
    required VideoModel model,
    required int index,
  }) async {
    try {
      final dataRef = _database.ref(dayOfTheWeek).child(index.toString());
      dataRef.set({
        'mediaUrl': model.mediaUrl,
        'imageVideo': model.imageVideo,
        'videoName': model.videoName,
        'isAvailable': model.isAvailable,
        'isWatched': true,
      });
    } catch (e) {
      throw e.toString();
    }
  }
}

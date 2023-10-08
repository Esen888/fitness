part of 'video_cubit.dart';

class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitialState extends VideoState {}

class VideoErrorState extends VideoState {
  final String error;
  const VideoErrorState({required this.error});
}

class VideoSuccessState extends VideoState {
  final List<VideoModel> data;
  const VideoSuccessState({required this.data});
}

class VideoFinishSuccessState extends VideoState {
  const VideoFinishSuccessState();
}

class VideoLoadingState extends VideoState {}

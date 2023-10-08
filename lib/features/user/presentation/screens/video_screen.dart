import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:BodyPower/features/user/data/models/video_model.dart';
import 'package:BodyPower/features/user/presentation/logic/video_cubit/video_cubit.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    Key? key,
    this.mediaUrl,
    required this.dayOfTheWeek,
    required this.index,
    required this.model,
  }) : super(key: key);
  final String? mediaUrl;
  final String dayOfTheWeek;
  final int index;
  final VideoModel model;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final mediaURL = YoutubePlayer.convertUrlToId(widget.mediaUrl ?? '');
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    _playerController = YoutubePlayerController(initialVideoId: mediaURL ?? '');

    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  void _onEnded() {
    BlocProvider.of<VideoCubit>(context).finishWorkout(
      index: widget.index,
      dayOfTheWeek: widget.dayOfTheWeek,
      model: widget.model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoCubit, VideoState>(
      listener: (context, state) {
        if (state is VideoFinishSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorHelper.backgroundColor,
          elevation: 0,
        ),
        backgroundColor: ColorHelper.backgroundColor,
        body: Column(
          children: [
            const Spacer(),
            YoutubePlayer(
              controller: _playerController,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
              ],
              onEnded: (metaData) => _onEnded(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ElevatedButton(
                onPressed: () => _onEnded(),
                child: Text(
                  'Завершить тренировку',
                  style: TextHelper.w500s12
                      .copyWith(color: ColorHelper.black000000),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseIntroVideoPlayer extends StatefulWidget {
  final String videoLink;
  const CourseIntroVideoPlayer({
    super.key,
    required this.videoLink,
  });

  @override
  State<CourseIntroVideoPlayer> createState() => _CourseIntroVideoPlayerState();
}

class _CourseIntroVideoPlayerState extends State<CourseIntroVideoPlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoLink.isNotEmpty && _isValidUrl(widget.videoLink)) {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
      if (videoId != null) {
        controller = YoutubePlayerController(
          flags: const YoutubePlayerFlags(
              
              autoPlay: false,
             ),
          initialVideoId: videoId,
        );
      } else {
        controller = YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(
                    "https://youtu.be/wiDjjB0nx_g?si=7GD2_3R8NUyKNGAb") ??
                "");
      }
    } else {
      controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
                  "https://youtu.be/wiDjjB0nx_g?si=7GD2_3R8NUyKNGAb") ??
              "");
    }
  }

  bool _isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (_) {
      return false;
    }
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(15.r),
      child: SizedBox(
        height: 200.h,
        child: YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: false,
          bottomActions: [
            // ProgressBar(),
      
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            ),
            // PlayPauseButton(),
            RemainingDuration()
          ],
        ),
      ),
    );
  }
}

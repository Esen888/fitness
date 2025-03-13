import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CourseIntroVideoPlayer extends StatefulWidget {
  final String videoLink;
  const CourseIntroVideoPlayer({super.key, required this.videoLink});

  @override
  State<CourseIntroVideoPlayer> createState() => _CourseIntroVideoPlayerState();
}

class _CourseIntroVideoPlayerState extends State<CourseIntroVideoPlayer> {
  late YoutubePlayerController controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    final videoId = YoutubePlayerController.convertUrlToId(widget.videoLink) ?? "wiDjjB0nx_g";
    
    controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
          strictRelatedVideos: true, // ✅ Disable suggested videos at the end
        showVideoAnnotations: false, // ✅ Hide annotations

        enableJavaScript: true,
        // origin: "https://24body-positive.ru/"
        // enableKeyboard: true,
      ),
    );

    setState(() {
      isInitialized = true; // ✅ Set to true when the controller is ready
    });
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(15.r),
      child: SizedBox(
        // height: 200.h,
        child: isInitialized
            ? YoutubePlayerScaffold(
                controller: controller,
                aspectRatio: 16 / 9,
                builder: (context, player) {
                  return player;
                },
              )
            : const Center(child: CircularProgressIndicator()), // ✅ Show a loader until initialized
      ),
    );
  }
}

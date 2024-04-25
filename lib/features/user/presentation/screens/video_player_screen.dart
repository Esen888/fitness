import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoLink;
  const VideoPlayerScreen({Key? key, required this.videoLink})
      : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoLink.isNotEmpty && _isValidUrl(widget.videoLink)) {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
      if (videoId != null) {
        controller = YoutubePlayerController(
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    controller?.dispose();
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.landscape) {
        return Scaffold(
          body: youtubeHierarchy(),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Просмотр упражнения"),
          ),
          body: youtubeHierarchy(),
        );
      }
    });
  }

  youtubeHierarchy() {
    return SizedBox(
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayer(
            controller: controller??YoutubePlayerController(initialVideoId: "https://youtu.be/wiDjjB0nx_g?si=7GD2_3R8NUyKNGAb"),
          ),
        ),
      ),
    );
  }
}
import 'package:BodyPower/core/utils/app_colors.dart';
import 'package:BodyPower/core/utils/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  const VideoPlayerScreen({super.key, required this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            "https://youtu.be/Gmk46Tur1Uc?si=AXwBE3oheNIljU8l")!)
      ..addListener(() {
        if (mounted) {}
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
            title: Text(widget.title),
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
            controller: controller,
          ),
        ),
      ),
    );
  }
}

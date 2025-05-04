import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const StoryVideoPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? AspectRatio(aspectRatio: 9 / 16, child: VideoPlayer(controller))
        : const CircularProgressIndicator(color: Colors.white);
  }
}

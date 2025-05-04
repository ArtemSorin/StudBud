import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/stories/story_app_bar.dart';
import '../widgets/stories/story_footer.dart';
import '../widgets/stories/story_video_player.dart';

class StoryViewer extends StatefulWidget {
  final String storyUrl;

  const StoryViewer({super.key, required this.storyUrl});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.storyUrl))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: StoryVideoPlayer(controller: _controller)),
          const StoryAppBar(),
          const StoryFooter(),
        ],
      ),
    );
  }
}

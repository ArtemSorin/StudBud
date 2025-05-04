import 'package:flutter/material.dart';

import '../../screens/story_screen.dart';

class StoryAvatar extends StatelessWidget {
  final String name;
  final IconData? icon;
  final String? imageUrl;
  final String? storyUrl;

  const StoryAvatar({
    super.key,
    required this.name,
    this.icon,
    this.imageUrl,
    this.storyUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (storyUrl != null) {
          Navigator.push(
            context,
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => StoryViewer(storyUrl: storyUrl!),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black,
              child:
                  imageUrl != null
                      ? CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(imageUrl!),
                      )
                      : Icon(icon, size: 28, color: Colors.white),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}

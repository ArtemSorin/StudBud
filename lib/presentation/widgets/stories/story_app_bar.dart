import 'package:flutter/material.dart';

class StoryAppBar extends StatelessWidget {
  const StoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

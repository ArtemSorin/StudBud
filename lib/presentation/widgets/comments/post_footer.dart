import 'package:flutter/material.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(Icons.favorite, color: Colors.black),
        SizedBox(width: 5),
        Text("3.2K"),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../screens/comments_screen.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String time;
  final String text;
  final List<String> imageUrls;
  final String avatarUrl;
  final String likes;
  final String comments;

  const PostWidget({
    super.key,
    required this.name,
    required this.time,
    required this.text,
    required this.imageUrls,
    required this.avatarUrl,
    required this.likes,
    required this.comments,
  });

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(url, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(time, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: imageUrls.map(_buildImage).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.black),
                  const SizedBox(width: 5),
                  Text(likes),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.comment),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommentsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(comments),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

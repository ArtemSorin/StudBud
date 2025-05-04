import 'package:flutter/material.dart';

class ProfilePostWidget extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String content;
  final List<String> images;
  final String likes;
  final String comments;

  const ProfilePostWidget({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.content,
    required this.images,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(timeAgo, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(content, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children:
                images
                    .map(
                      (url) => ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(url, fit: BoxFit.cover),
                      ),
                    )
                    .toList(),
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
                  const Icon(Icons.comment, color: Colors.black),
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

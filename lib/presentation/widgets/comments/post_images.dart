import 'package:flutter/material.dart';

class PostImages extends StatelessWidget {
  const PostImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildImage('https://via.placeholder.com/150'),
        _buildImage('https://via.placeholder.com/150'),
        _buildImage('https://via.placeholder.com/150'),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}

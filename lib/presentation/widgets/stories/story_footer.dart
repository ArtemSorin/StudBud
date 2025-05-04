import 'package:flutter/material.dart';

class StoryFooter extends StatelessWidget {
  const StoryFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Анна Асоль',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Поступила в ИТМО!',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite, color: Colors.white, size: 28),
                  SizedBox(width: 8),
                  Text(
                    "1.2K",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.comment, color: Colors.white, size: 28),
                  SizedBox(width: 8),
                  Text(
                    "256",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

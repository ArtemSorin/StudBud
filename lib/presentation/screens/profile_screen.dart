import 'package:flutter/material.dart';

import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_post_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ProfileHeader(),
            Divider(),
            ProfilePostWidget(
              username: 'Анна Асоль',
              timeAgo: 'Только что',
              content: 'Хочу показать свой результат TOEFL. Что думаете?',
              images: [
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
              ],
              likes: '3.2K',
              comments: '333',
            ),
            Divider(),
            ProfilePostWidget(
              username: 'Анна Асоль',
              timeAgo: '1 час назад',
              content:
                  'Фото с моей последней поездки в горы! Это было незабываемо.',
              images: [
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
              ],
              likes: '1.8K',
              comments: '120',
            ),
          ],
        ),
      ),
    );
  }
}

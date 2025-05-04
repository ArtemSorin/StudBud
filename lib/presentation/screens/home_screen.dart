import 'package:flutter/material.dart';

import '../widgets/home/post.dart';
import '../widgets/home/story_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  StoryAvatar(name: 'Добавить', icon: Icons.add),
                  StoryAvatar(
                    name: 'Анна',
                    imageUrl: 'https://via.placeholder.com/50',
                  ),
                  StoryAvatar(
                    name: 'Иван',
                    imageUrl: 'https://via.placeholder.com/50',
                    storyUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  ),
                  StoryAvatar(
                    name: 'Елена',
                    imageUrl: 'https://via.placeholder.com/50',
                    storyUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  ),
                  StoryAvatar(
                    name: 'Дима',
                    imageUrl: 'https://via.placeholder.com/50',
                    storyUrl: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  ),
                ],
              ),
            ),
            const Divider(),
            PostWidget(
              name: 'Анна Асоль',
              time: 'Только что',
              text: 'Хочу показать свой результат TOEFL. Что думаете?',
              imageUrls: [
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
              ],
              avatarUrl: 'https://via.placeholder.com/50',
              likes: '3.2K',
              comments: '333',
            ),
            const Divider(),
            PostWidget(
              name: 'Иван Петров',
              time: '2 ч назад',
              text: 'Вчерашняя прогулка по парку — просто волшебство!',
              imageUrls: [
                'https://via.placeholder.com/150',
                'https://via.placeholder.com/150',
              ],
              avatarUrl: 'https://via.placeholder.com/50',
              likes: '1.1K',
              comments: '120',
            ),
            const Divider(),
            PostWidget(
              name: 'Елена Морозова',
              time: '1 день назад',
              text: 'Мой новый арт! 🎨 Как вам?',
              imageUrls: ['https://via.placeholder.com/150'],
              avatarUrl: 'https://via.placeholder.com/50',
              likes: '980',
              comments: '87',
            ),
          ],
        ),
      ),
    );
  }
}

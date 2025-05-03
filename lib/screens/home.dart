import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildImagePost(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildStoryAvatar(String name, IconData? icon, {String? imageUrl}) {
    return Padding(
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
                      backgroundImage: NetworkImage(imageUrl),
                    )
                    : Icon(icon, size: 28, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String name,
    required String time,
    required String text,
    required List<String> imageUrls,
    required String avatarUrl,
    required String likes,
    required String comments,
  }) {
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
            children: imageUrls.map(_buildImagePost).toList(),
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
                children: [
                  _buildStoryAvatar('Добавить', Icons.add),
                  _buildStoryAvatar(
                    'Анна',
                    null,
                    imageUrl: 'https://via.placeholder.com/50',
                  ),
                  _buildStoryAvatar(
                    'Иван',
                    null,
                    imageUrl: 'https://via.placeholder.com/50',
                  ),
                  _buildStoryAvatar(
                    'Елена',
                    null,
                    imageUrl: 'https://via.placeholder.com/50',
                  ),
                  _buildStoryAvatar(
                    'Дима',
                    null,
                    imageUrl: 'https://via.placeholder.com/50',
                  ),
                ],
              ),
            ),
            const Divider(),

            _buildPost(
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
            _buildPost(
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
            _buildPost(
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

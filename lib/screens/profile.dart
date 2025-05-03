import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Анна Асоль',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Таганрог, Россия',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ProfileDetail(label: 'Возраст', value: '25'),
                      _ProfileDetail(label: 'Пол', value: 'Женский'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Интересы:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  _InterestChips(
                    interests: [
                      'Математика',
                      'Программирование',
                      'Технологии',
                      'Музыка',
                      'Фитнес',
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Column(
              children: [
                _buildPost(
                  'Анна Асоль',
                  'Только что',
                  'Хочу показать свой результат TOEFL. Что думаете?',
                  [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                  '3.2K',
                  '333',
                ),
                const Divider(),
                _buildPost(
                  'Анна Асоль',
                  '1 час назад',
                  'Фото с моей последней поездки в горы! Это было незабываемо.',
                  [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                  '1.8K',
                  '120',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost(
    String username,
    String timeAgo,
    String content,
    List<String> images,
    String likes,
    String comments,
  ) {
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ProfileDetail extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _InterestChips extends StatelessWidget {
  final List<String> interests;
  const _InterestChips({required this.interests});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children:
          interests.map((interest) {
            return Chip(
              label: Text(interest),
              backgroundColor: Colors.black,
              labelStyle: const TextStyle(color: Colors.white),
            );
          }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'interest_chips.dart';
import 'profile_detail.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Анна Асоль',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Таганрог, Россия',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileDetail(label: 'Возраст', value: '25'),
              ProfileDetail(label: 'Пол', value: 'Женский'),
            ],
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Интересы:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          InterestChips(
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
    );
  }
}

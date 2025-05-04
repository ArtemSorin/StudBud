import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        SizedBox(height: 10),
        Text(
          'Анна Асоль',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4),
        Text('+7 ••• ••• •• 43', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 12),
      ],
    );
  }
}

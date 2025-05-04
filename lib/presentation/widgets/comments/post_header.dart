import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
      ),
      title: Text('Анна Асоль', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Только что'),
    );
  }
}

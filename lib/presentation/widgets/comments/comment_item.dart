import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final int id;
  final String name;
  final String text;

  const CommentItem({
    super.key,
    required this.id,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(text),
    );
  }
}

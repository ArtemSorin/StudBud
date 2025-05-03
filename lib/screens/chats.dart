import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _buildChatItem(
              avatarUrl: 'https://via.placeholder.com/50',
              name: 'Иван Петров',
              lastMessage: 'Привет, ты уже поступила во ВШЭ?',
              time: '10:30',
              isUnread: true,
            ),
            const Divider(),
            _buildChatItem(
              avatarUrl: 'https://via.placeholder.com/50',
              name: 'Елена Морозова',
              lastMessage: 'Я сдала математику.',
              time: '9:15',
              isUnread: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildChatItem({
    required String avatarUrl,
    required String name,
    required String lastMessage,
    required String time,
    required bool isUnread,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: isUnread ? Colors.black : Colors.grey),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: isUnread ? Colors.black : Colors.grey,
              fontSize: 12,
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () {},
    );
  }
}

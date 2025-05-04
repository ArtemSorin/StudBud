import 'package:flutter/material.dart';

import '../widgets/chats/chat_item.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            ChatItem(
              avatarUrl: 'https://via.placeholder.com/50',
              name: 'Иван Петров',
              lastMessage: 'Привет, ты уже поступила во ВШЭ?',
              time: '10:30',
              isUnread: true,
            ),
            Divider(),
            ChatItem(
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
}

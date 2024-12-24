import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Anna Asol',
            lastMessage: 'Hi! How are you?',
            time: '10:30 AM',
            isUnread: true,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'John Doe',
            lastMessage: 'Let\'s meet tomorrow.',
            time: '9:15 AM',
            isUnread: false,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Sophia Smith',
            lastMessage: 'Check this out!',
            time: 'Yesterday',
            isUnread: false,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Michael Brown',
            lastMessage: 'Thanks for the update.',
            time: 'Yesterday',
            isUnread: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Добавить действие для создания нового чата
        },
        child: Icon(Icons.edit, color: Colors.white),
        backgroundColor: Colors.black,
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
        style: TextStyle(
          color: isUnread ? Colors.black : Colors.grey,
        ),
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
              margin: EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () {
        // Действие при нажатии на чат
      },
    );
  }
}
